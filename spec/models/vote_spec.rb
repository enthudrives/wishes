require 'spec_helper'

describe Vote do
  it { should belong_to :user }
  it { should belong_to :wish }

  it { should allow_mass_assignment_of :wish_id }

  it { should_not allow_mass_assignment_of :user_id }

  it "is a unique vote" do
    create(:vote, user_id: 1, wish_id: 1)
    build(:vote, user_id: 1, wish_id: 1).should_not be_valid
  end
end