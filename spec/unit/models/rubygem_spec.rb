require "spec_helper_lite"
require "#{ROOT}/app/models/rubygem"


describe Rubygem do
  before :each do
    @rubygem = Rubygem.new(name: "a gem", ruby_version: "1.9.3")
  end

  it { should be_valid }
  it { should respond_to :name }
end
