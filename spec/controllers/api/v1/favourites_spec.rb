require 'rails_helper'

RSpec.describe Api::V1::FavouritesController, type: :controller do
  let(:admin) do
    FactoryBot.create(:user, username: 'emmisteel', email: 'emmisteel@gmail.com', password: '123456',
                             password_confirmation: '123456', admin: true, id: 1)
  end

  describe 'Get All Favourites' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      get :index
    end
    it { expect(response).to have_http_status(:ok) }

    it 'should return favourites array' do
      expect(response.body).to include('ok')
    end
  end

  describe 'Get All Favourites' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      get :show
    end
    it { expect(response).to have_http_status(:ok) }

    it 'should return favourites array' do
      expect(response.body).to include('200')
    end
  end
end
