require 'rails_helper'

RSpec.describe Api::V1::ShirtsController, type: :controller do
  let(:admin) do
    FactoryBot.create(:user, username: 'emmisteel', email: 'emmisteel@gmail.com', password: '123456',
                             password_confirmation: '123456', admin: true, id: 1)
  end

  describe 'Get All Shirts' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      get :index
    end
    it { expect(response).to have_http_status(:ok) }

    it 'should return shirts array' do
      expect(response.body).to include('ok')
    end
  end

  describe 'Post New Shirt' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      post :create,
           params: { name: 'my shirt', description: 'this shirt is really big', price: 23_455,
                     image: { url: 'image url' } }
    end
    it { expect(response).to have_http_status(:created) }

    it { expect(response.body).to include('this shirt is really big') }
  end

  describe 'Fail to Post New Shirt' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      post :create, params: { description: 'this shirt is really big' }
    end
    it { expect(response).to have_http_status(:unprocessable_entity) }
  end

  describe 'Update Old Shirt' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      FactoryBot.create(:shirt, id: 1, name: 'no coffee', description: 'the best shirt to have is here', price: 345)
      post :update,
           params: { use_route: 'api/v1/shirts/', id: 1, name: 'my shirt', description: 'this shirt is really big',
                     price: 23_455, image: { url: 'image url' } }
    end
    it { expect(response).to have_http_status(:ok) }

    it { expect(response.body).to include('this shirt is really big') }
  end

  describe 'Fail to Update Old Shirt' do
    before do
      allow(controller).to receive(:current_user).and_return(admin)
      post :update, params: { use_route: 'api/v1/shirts/', id: 1, name: 'my shirt' }
    end
    it { expect(response).to have_http_status(:not_found) }
  end
end
