require "spec_helper_full"

describe WishesController do
  describe "#index" do
    it "works" do
      get :index
      assigns(:wishes).should_not be_nil
      response.should be_a_success
    end
  end
end
