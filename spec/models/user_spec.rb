require 'spec_helper'

describe User do
  it { should have_many :wishes }
  it { should have_many :recommendations }
  it { should have_many :votes }

  it "cannot have more than 3 wishes" do
    user = create(:user)
    create(:wish, user_id: user.id).should be_valid
    create(:wish, user_id: user.id, content: 'a' * 11).should be_valid
    create(:wish, user_id: user.id, content: 'y' * 11).should be_valid # fails
    build(:wish, user_id: user.id, content: 'c' * 11).should_not be_valid
  end
end
