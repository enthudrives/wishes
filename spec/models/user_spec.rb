require 'spec_helper'

describe User do
  before :each do
    @user = build(:user)
  end

  it { should have_many :wishes }
  it { should have_many :recommendations }
  it { should have_many :votes }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

end
