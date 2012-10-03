require "spec_helper_lite"
require_relative "../../../app/models/rubygem"


describe Rubygem do
  before(:each) { @rubygem = build(:rubygem) }
  subject { @rubygem }

  describe "validations", :vcr do
    describe "#name" do
      it "can't be blank" do
        build(:rubygem, name: "").should_not be_valid
      end

      it "must exist" do
        build(:rubygem, name: "non_existing_gem").should_not be_valid
      end
    end
  end
end
