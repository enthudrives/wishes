require "spec_helper_lite"
require "#{ROOT}/app/models/user"

describe User do
  before :each do
    @user = User.new(name: "Matz")
    @wish = double("wish")
  end

  it { should respond_to :name }
  it { should respond_to :wish_source }
  it { should respond_to :vote }
  it { should respond_to :cancel_vote }
  it { should respond_to :fulfill_wish }
  it { should respond_to :new_wish }

  it "is able to vote for a wish" do
    @wish.should_receive(:add_vote).with(@user)
    @user.vote(@wish)
  end

  it "is able to cancel his vote on a wish" do
    @wish.should_receive(:remove_vote).with(@user)
    @user.cancel_vote(@wish)
  end

  it "is able to fulfill a wish" do
    rubygem = double("rubygem")
    @wish.should_receive(:make_fulfilled).with(@user, rubygem)
    @user.fulfill_wish(@wish, rubygem)
  end

  it "can make a new wish" do
    @user.wish_source = ->(attributes){ @wish }
    @user.new_wish.should eq @wish
  end

  it "owns the made wish" do
    @user.new_wish.maker.should eq @user
  end
end
