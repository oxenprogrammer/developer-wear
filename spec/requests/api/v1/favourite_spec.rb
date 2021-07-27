require 'rails_helper'

RSpec.describe 'Api::V1::Favourites', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/favourite/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/api/v1/favourite/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/api/v1/favourite/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/api/v1/favourite/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
