require 'spec_helper'

describe Recommendation do
  it { should allow_mass_assignment_of :gem }
  it { should allow_mass_assignment_of :wish_id }

  it { should belong_to :wish }
  it { should belong_to :user }

  it { should validate_presence_of :gem }

  it "is a valid Rubygem" do
    recommendation = build(:recommendation)
    recommendation.gem = 'non_existing_gem'

    recommendation.should_not be_valid
  end
end
