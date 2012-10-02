require 'spec_helper'

describe User do
  it { should have_many :wishes }
  it { should have_many :recommendations }
  it { should have_many :votes }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should allow_mass_assignment_of :name }
end
