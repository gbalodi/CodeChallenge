require 'rails_helper'

RSpec.describe VisitorStatisticsController, type: :controller do

  describe "GET #get statistics data" do
    it "should provide visitor statistics data listing" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response.body).to be_present
    end
  end
end