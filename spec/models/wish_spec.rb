require 'spec_helper'

describe Wish do
  let(:wish) { wish = build(:wish) }

  it { should allow_mass_assignment_of :content }
  it { should_not allow_mass_assignment_of :user_id }

  it { should belong_to :user }
  it { should have_many :recommendations }
  it { should have_many :votes }

  # it { should validate_presence_of(:content).with_message("I'm sorry but did I miss your wish?") }

  # it { should ensure_length_of(:content).
                      # is_at_least(10).
                      # is_at_most(140)
                      # }

  it "is invalid without content" do
    wish.content = " "
    wish.should_not be_valid
  end

  it "isn't too short or too long" do
    wish.content = "a" * 9
    wish.should_not be_valid
    wish.content = "a" * 10
    wish.should be_valid
    wish.content = "a" * 141
    wish.should_not be_valid
    wish.content = "a" * 140
    wish.should be_valid
  end

  it "has unique content" do
    create(:wish)
    build(:wish, content: wish.content).should_not be_valid
  end

  it "starts with rank 0" do
    wish.rank.should eq 0
  end

  it "keeps track of its rank" do
    wish.save

    create(:user).votes.create(wish_id: wish.id)
    wish.rank.should eq 1

    create(:user, name: 'nick').votes.create(wish_id: wish.id)
    wish.rank.should eq 2
  end
end
