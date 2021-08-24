require 'rails_helper'

RSpec.describe 'Api::V1::Shirts', type: :request do
  describe 'GET /index' do
    it 'should returns http success' do
      get '/api/v1/shirts',
          headers: { 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.R3jkTSo9lfq6aj-kg7fELRIdE751enHyuBhBz1RgUDs' }
      expect(response).to have_http_status(:ok)
    end
  end
end
