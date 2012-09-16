require "spec_helper_lite"

describe "unit test" do
  it "doesn't load Rails" do
    defined?(Rails).should be_false
  end
end
