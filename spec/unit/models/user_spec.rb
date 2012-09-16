require "spec_helper_lite"
require_relative "#{ROOT}/app/models/user"
require_relative "#{ROOT}/app/models/wish"

describe User do
  before(:each) do
    @user = User.new
  end

  it "is able to vote up for a wish" do
    wish = Wish.new
    @user.upvote(wish)
    wish.rank.should eq(1)
  end

  it "is able to vote down for a wish" do
    wish = Wish.new
    @user.downvote(wish)
    wish.rank.should eq(-1)
  end

  it "is able to vote on the same wish only once" do
    wish = Wish.new
    @user.upvote(wish)
    @user.upvote(wish).should be_false
    wish.rank.should eq(1)
    @user.downvote(wish).should be_false
    wish.rank.should eq(1)
  end
end
