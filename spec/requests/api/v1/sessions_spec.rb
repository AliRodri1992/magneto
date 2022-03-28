require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/api/v1/sessions/login"
      expect(response).to have_http_status(:success)
    end
  end

end
