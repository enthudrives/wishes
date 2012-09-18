require "spec_helper_lite"
require "#{Rails.root}/app/models/wish"


describe Fulfillment do
  before(:each) do
    @fulfillment = Fulfillment.new(double("user"), double("wish"))
  end

end
