require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'GET api/v1/users' do
    it 'returns list of available users' do
      create(:user)
      total_users = User.all.count
      get api_v1_users_path
      expect(response).to have_http_status(:ok)
      resp = JSON.parse(response.body)
      total_resp = resp['data'].to_i
      expect(total_resp).to eq(total_users)
    end
  end

  describe 'GET api/v1/users/:id' do
    it 'returns a user' do
      user = create(:user)
      expected_response = { 'email' => user.email }
      get api_v1_user_path(id: user.id)
      expect(response).to have_http_status(:ok)
      resp = JSON.parse(response.body)
      expect(resp['data']['attributes']).to include(expected_response)
    end
  end

  describe 'POST /api/v1/users/' do
    it 'creates a new user' do
      total_users = User.all.count
      request_body = {
        user: {
          email: 'new@gmail.com',
          password: 'asdasd12ad'
        }
      }
      post api_v1_users_path, params: request_body
      expect(response).to have_http_status(:created)
      expect(User.all.count).to eq(total_users + 1)
    end
  end
end
