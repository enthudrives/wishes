require "spec_helper_lite"
require_relative "../../app/models/wish"

describe Wish do
  before(:each) { @wish = build(:wish) }
  subject { @wish }

  describe "validations" do
    describe "#content" do
      it "must have between 10 and 140 characters" do
        build(:wish, content: "c" * 9).should_not be_valid
        build(:wish, content: "c" * 141).should_not be_valid
      end
    end
  end

  it "starts with zero voters" do
    @wish.voters.should be_empty
  end

  it "keeps track of its voters" do
    user = double("user")
    @wish.add_upvote(user)
    @wish.voters.should include(user)

    user2 = double("user2")
    @wish.add_upvote(user2)
    @wish.voters.should include(user)
    @wish.voters.should include(user2)

    @wish.remove_vote(user)
    @wish.voters.should_not include(user)
    @wish.voters.should include(user2)
  end

  it "starts with 0 rank" do
    @wish.rank.should eq 0
  end

  it "keeps track of its rank" do
    user = double("user")

    @wish.add_upvote(user)
    @wish.rank.should eq 1

    @wish.add_downvote(user)
    @wish.rank.should eq -1

    @wish.remove_vote(user)
    @wish.rank.should eq 0
  end

  it "doesn't add vote twice for the same user" do
    user = double("user")

    @wish.add_upvote(user)
    @wish.add_upvote(user)
    @wish.voters.count.should == 1

    @wish.add_downvote(user)
    @wish.add_downvote(user)
    @wish.voters.count.should == 1
  end

  it "can take a recommendation" do
    recommendation = double(recommender: "someone")
    @wish.new_recommendation(recommendation)
    @wish.recommendations.should include(recommendation)
  end

  it "starts unfulfilled" do
    @wish.should_not be_fulfilled
  end

  it "can be fulfilled" do
    gem = double("gem", recommender: "someone")
    @wish.make_fulfilled(gem)
    @wish.should be_fulfilled
  end

  it "knows what fulfilled it" do
    gem = double("gem", recommender: "someone")
    @wish.make_fulfilled(gem)
    @wish.fulfillment.should eq gem
  end

  it "knows who fulfilled it" do
    gem = double("gem", recommender: "someone")
    @wish.make_fulfilled(gem)
    @wish.fulfiller.should eq "someone"
  end
end
