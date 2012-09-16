require "spec_helper_lite"
require_relative "#{ROOT}/app/models/wish"
require_relative "#{ROOT}/app/models/user"

describe Wish do
  before(:each) do
    @wish = Wish.new
  end

  it "starts with zero voters" do
    @wish.voters.should be_empty
  end

  it "keeps track of its voters" do
    user = User.new
    user.upvote(@wish)
    @wish.voters.should eq([user])
  end

  it "starts with rank equal to zero" do
    @wish.rank.should eq(0)
  end

  it "keeps track of the rank" do
    user1 = User.new
    user2 = User.new

    user1.upvote(@wish)
    @wish.rank.should eq(1)
    user2.downvote(@wish)
    @wish.rank.should eq(0)
  end

  it "doesn't allow the same user to vote for it twice" do
    user = User.new
    user.upvote(@wish)
    user.upvote(@wish)
    @wish.rank.should eq(1)
    @wish.voters.should eq([user])
  end
end
