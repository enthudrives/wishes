require "spec_helper_lite"
require "#{ROOT}/app/models/user"

describe User do
  before :each do
    @user = User.new(name: "Matz")
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

  # failing spec, not exactly sure how to test this
  it "is able to fulfill a wish" do
    wish = double("wish")
    rubygem = double("rubygem", name: 'rails')
    wish.should_receive(:make_fulfilled).with(@user, rubygem)
    @user.fulfill_wish(wish, rubygem.name)
  end

  it "can make a new wish" do
    wish = double("wish")
    @user.wish_source = ->(attributes){ wish }
    @user.new_wish.should eq wish
  end

  it "owns the made wish" do
    wish = double("wish")
    @user.wish_source = ->(attributes){ double("wish", attributes) }
    @user.new_wish.maker.should eq @user
  end
end
