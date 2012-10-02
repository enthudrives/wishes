require 'spec_helper'

describe Wish do
  before(:each) { @wish = build(:wish) }

  it { should allow_mass_assignment_of :content }
  it { should_not allow_mass_assignment_of :user_id }

  it { should belong_to :user }
  it { should have_many :recommendations }
  it { should have_many :votes }

  it { should validate_presence_of :content }
  it { should ensure_length_of(:content).
                      is_at_least(10).
                      is_at_most(140)
                      }

  it "has unique content" do
    create(:wish)
    @wish.should_not be_valid
  end

  it "starts with rank 0" do
    @wish.rank.should eq 0
  end
end
