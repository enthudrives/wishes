require "spec_helper_lite"
require "#{ROOT}/app/models/user"

describe User do
  before(:each) do
    @user = User.new
  end

  it "is able to vote for a wish" do
    wish = double("wish")
    wish.should_receive(:add_vote).with(@user)
    @user.vote(wish)
  end

  it "is able to cancel his vote on a wish" do
    wish = double("wish")
    wish.should_receive(:remove_vote).with(@user)
    @user.cancel_vote(wish)
  end

  it "is able to fulfill a wish" do
    wish = double("wish")
    gem = "some gem"
    wish.should_receive(:make_fulfilled).with(@user, gem)
    @user.fulfill_wish(wish, gem)
  end
end
