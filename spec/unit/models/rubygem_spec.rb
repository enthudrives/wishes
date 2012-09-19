require "spec_helper_lite"
require "#{ROOT}/app/models/rubygem"


describe Rubygem do
  before :each do
    @rubygem = Rubygem.new("rails")
  end

  subject { @rubygem }

  it { should be_valid }
  it { should respond_to :name }

  it "should not be valid if unexisting gem is provided" do
    @rubygem.name = "i_dont_exist_n381bv93"
    should_not be_valid
  end
end
