require 'spec_helper'

describe Wish do
  let(:wish) { wish = create(:wish) }

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
    build(:wish, content: wish.content).should_not be_valid
  end

  it "starts with rank 0" do
    wish.rank.should eq 0
  end

  it "keeps track of its rank" do
    create(:user).votes.create(wish_id: wish.id)
    wish.rank.should eq 1

    create(:user, id: 2, name: 'nick').votes.create(wish_id: wish.id)
    wish.rank.should eq 2
  end
end
