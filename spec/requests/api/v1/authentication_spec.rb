require 'rails_helper'

RSpec.describe 'Api::V1::Authentications', type: :request do
  describe 'POST /authenticate' do
    let(:user) do
      FactoryBot.create(:user, email: 'jack@gmail.com', username: 'jack', password: '123456',
                               password_confirmation: '123456')
    end
    it 'should authenticate the client' do
      post '/api/v1/login', params: { email: user.email, password: user.password }

      expect(response).to have_http_status(:ok)
      expect(response_body).to include(
        {
          'admin' => false,
          'email' => 'jack@gmail.com',
          'username' => 'jack'
        }
      )
    end

    it 'should return error when password is missing' do
      post '/api/v1/login', params: { email: 'jack@gmail.com' }
      expect(response).to have_http_status(:bad_request)
      expect(response_body).to include
    end

    it 'should return error when email is missing' do
      post '/api/v1/login', params: { password: '123456' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to include
    end

    it 'should return unauthorized for an incorrect password' do
      post '/api/v1/login', params: { email: user.email, password: 'incorrect password' }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
