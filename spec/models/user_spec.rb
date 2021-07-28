require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    FactoryBot.create(:user, username: 'emmisteel', email: 'emmisteel@gmail.com', password: '123456',
                             password_confirmation: '123456')
  end

  it 'should have valid attributes' do
    expect(user).to be_valid
  end

  it 'should not miss any attributes' do
    @user = User.create(password: nil)
    expect(@user).to_not be_valid
  end

  it { should have_many(:favourites).without_validating_presence }

  it { should have_many(:shirts).without_validating_presence }
end
