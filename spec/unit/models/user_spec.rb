require "spec_helper_lite"
require_relative "#{ROOT}/app/models/user"
require_relative "#{ROOT}/app/models/wish"

describe User do
  before(:each) do
    @user = User.new
    @wish = Wish.new("just a wish")
  end

  it "is able to vote for a wish" do
    @user.vote(@wish)
    @wish.rank.should eq 1
  end

  it "is able to vote for the same wish only once" do
    @user.vote(@wish)
    @user.vote(@wish).should be_false

    @wish.rank.should eq 1
  end

  it "is able to cancel his vote on a wish" do
    @user.vote(@wish)
    @user.cancel_vote(@wish)

    @wish.rank.should eq 0
  end

  it "is able to cancel his vote only if actually voted" do
    @user.cancel_vote(@wish).should be_false
  end

  it "is able to fulfill a wish" do
    gem = "some gem"
    @user.fulfill(@wish, gem)
    @wish.fulfillment.should eq gem
  end
end
