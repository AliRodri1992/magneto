require 'rails_helper'

RSpec.describe "Api::V1::DnaAnalizers", type: :request do
  describe "GET /mutant" do
    it "returns http success" do
      get "/api/v1/dna_analizers/mutant"
      expect(response).to have_http_status(:success)
    end
  end

end
