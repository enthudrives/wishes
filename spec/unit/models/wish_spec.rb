require "spec_helper_lite"
require_relative "#{ROOT}/app/models/wish"
require_relative "#{ROOT}/app/models/user"

describe Wish do
  before(:each) do
    @wish = Wish.new("just a wish")
  end

  it "starts with zero voters" do
    @wish.voters.should be_empty
  end

  it "keeps track of its voters" do
    user1 = User.new
    user2 = User.new
    user1.vote(@wish)
    user2.vote(@wish)
    user1.cancel_vote(@wish)

    @wish.voters.should eq [user2]
  end

  it "starts with 0 rank" do
    @wish.rank.should eq 0
  end

  it "keeps track of its rank" do
    user1 = User.new
    user2 = User.new

    user1.vote(@wish)
    user2.vote(@wish)
    user1.cancel_vote(@wish)

    @wish.rank.should eq 1
  end

  it "knows if it's fulfilled" do
    user = User.new
    @wish.fulfilled?.should be_false
    user.fulfill(@wish, "asd")
    @wish.fulfilled?.should be_true
  end

  it "knows about it's fulfillment" do
    user = User.new
    user.fulfill(@wish, "asd")
    @wish.fulfillment.should eq "asd"
  end

  it "knows who fulfilled it" do
    user = User.new
    user.fulfill(@wish, "asd")
    @wish.fulfilled_by.should eq user
  end

  # we already check for this in the user specs, right?
  #
  # it "doesn't allow the same user to vote for it twice" do
  #   user = User.new
  #   user.vote(@wish)
  #   user.vote(@wish)
  #   @wish.rank.should eq(1)
  #   @wish.voters.should eq([user])
  # end
end
