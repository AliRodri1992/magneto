require 'rails_helper'

RSpec.describe 'Api::V1::DnaAnalizers', type: :request do
  describe 'POST /mutant' do
    it 'returns an HTTP 200-OK, in case of verifying if it is mutant' do
      post '/api/v1/mutant'
      expect(response).to have_http_status(:success)
    end
  end
end
