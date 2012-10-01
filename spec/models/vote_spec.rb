require 'spec_helper'

describe Vote do
  it { should belong_to :user }
  it { should belong_to :wish }

  it { should allow_mass_assignment_of :wish_id }

  it "is a unique vote" do
    create(:vote)
    build(:vote).should_not be_valid
  end

end