require "spec_helper_lite"
require "#{ROOT}/app/models/rubygem"


describe Rubygem do
  before(:each) { @rubygem = Rubygem.new(name: "rails") }
  subject { @rubygem }

  it { should be_valid }

  describe "validations" do
    describe "#name" do
      it "can't be blank" do
        @rubygem.name = ""
        @rubygem.should_not be_valid
      end

      it "must exist" do
        @rubygem.name = "non_existing_gem"
        @rubygem.should_not be_valid
      end
    end
  end
end
