require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:admin) do
    FactoryBot.create(:user, username: 'emmisteel', email: 'emmisteel@gmail.com', password: '123456',
                             password_confirmation: '123456', admin: true, id: 1)
  end

  describe 'Get All Users' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      get :index
    end
    it { expect(response).to have_http_status(:ok) }

    it 'should return users array' do
      expect(response.body).to include('ok')
    end
  end

  describe 'Register New User' do
    before do
      post :create,
           params: { username: 'emmisteel', email: 'em@gmail.com', password: '123456',
                     password_confirmation: '123456' }
    end
    it { expect(response).to have_http_status(:created) }

    it { expect(response.body).to include('emmisteel') }
  end

  describe 'Fail to Register New User if email is incorrect' do
    before do
      post :create, params: { username: 'emmisteel', email: 'emmisteel', password: '123456',
                              password_confirmation: '123456' }
    end
    it { expect(response).to have_http_status(:unprocessable_entity) }
  end

  describe 'No User Update unless Admin' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      FactoryBot.create(:user, id: 4, username: 'emmisteel', email: 'em@gmail.com', password: '123456',
                               password_confirmation: '123456')
      post :update,
           params: { use_route: 'api/v1/users/', id: 4, username: 'emmisteel', email: 'new_email@gmail.com', password: '123456',
                     password_confirmation: '123456' }
    end
    it { expect(response).to have_http_status(:forbidden) }
  end

  describe 'User Destroy if Admin' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      FactoryBot.create(:user, id: 4, username: 'emmisteel', email: 'em@gmail.com', password: '123456',
                               password_confirmation: '123456')
      post :destroy,
           params: { use_route: 'api/v1/users/', id: 4 }
    end
    it { expect(response).to have_http_status(:no_content) }
  end
end
