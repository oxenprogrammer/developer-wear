require 'rails_helper'

RSpec.describe Favourite, type: :model do
  let(:user) do
    FactoryBot.create(:user, username: 'emmisteel', email: 'emmisteel@gmail.com', password: '123456',
                             password_confirmation: '123456')
  end

  let(:shirt) do
    FactoryBot.create(:shirt, name: 'no coffee', description: 'the best shirt to have is here', price: 345)
  end

  let(:favourite) { FactoryBot.create(:favourite, user_id: user.id, shirt_id: shirt.id) }

  it 'should have valid attributes' do
    expect(favourite).to be_valid
  end

  it 'should not miss any attributes' do
    @favourite = Favourite.create(user_id: nil)
    expect(@favourite).to_not be_valid
  end

  it { should belong_to(:user).without_validating_presence }

  it { should belong_to(:shirt).without_validating_presence }
end
