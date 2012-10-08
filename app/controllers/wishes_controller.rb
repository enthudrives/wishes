class WishesController < ApplicationController
  def show
    @wish = Wish.find(params[:id])
  end

  def index; end

  def hi; end
end