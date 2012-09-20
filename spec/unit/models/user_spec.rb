require "spec_helper_lite"
require "#{ROOT}/app/models/user"

describe User do
  before(:each) { @user = build(:user) }
  subject { @user }

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
    rubygem = double("rubygem")
    wish.should_receive(:make_fulfilled).with(@user, rubygem)
    @user.fulfill_wish(wish, rubygem)
  end

  it "can make a new wish" do
    wish = double("wish")
    @user.wish_source = ->(attributes){ wish }
    @user.new_wish.should eq wish
  end

  it "owns the made wish" do
    wish = double("wish")
    @user.wish_source = ->(attributes){ wish.tap {|wish| wish.stub(attributes) } }
    @user.new_wish.maker.should eq @user
  end
end
