require 'rails_helper'

RSpec.describe 'Api::V1::Shirts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/shirts/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/api/v1/shirts/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/api/v1/shirts/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
