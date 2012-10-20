class WishesController < ApplicationController
  before_filter :redirect_if_no_wishes_left, only: :new

  def index
    @latest_wishes = Wish.latest
    @popular_wishes = Wish.popular
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def new
    @wish = current_user.wishes.build
  end

  def create
    @wish = current_user.wishes.build(params[:wish])
    if @wish.save
      redirect_to @wish, notice: "You've just made a wish!"
    else
      flash.now[:error] = "Something went wrong with your wish"
      render 'new'
    end
  end

  def vote
    @wish = Wish.find(params[:id])
    vote = current_user.votes.build(wish_id: params[:id])

    respond_to do |format|
      if vote.save
        format.html { render @wish, notice: "Successfully voted" }
        format.js
      else
        format.html { redirect_to @wish, notice: "already voted" }
        format.js
      end
    end
  end

  def unvote
    @wish = Wish.find(params[:id])
    vote = current_user.votes.where("wish_id = ?", params[:id])

    respond_to do |format|
      if vote.destroy(vote)
        format.html { redirect_to @wish, notice: "Successfully UNvoted" }
        format.js
      else
        format.html { redirect_to @wish, notice: "havent voted" }
        format.js
      end
    end
  end

  private

  def redirect_if_no_wishes_left
    redirect_to root_path, notice: "You spent all your #{User::MAX_NO_OF_WISHES} wishes" unless current_user.has_wishes_left?
  end
end