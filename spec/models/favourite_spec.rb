require 'rails_helper'
require 'rspec_api_documentation/dsl'

# A favourite model
RSpec.describe Favourite, type: :model do
  # First we need a user created in the DB
  let(:user) do
    FactoryBot.create(:user, username: 'emmisteel', email: 'emmisteel@gmail.com', password: '123456',
                             password_confirmation: '123456')
  end

  # We also need a shirt present in the DB
  let(:shirt) do
    FactoryBot.create(:shirt, name: 'no coffee', description: 'the best shirt to have is here', price: 345)
  end

  # We can then allow the created user to make a shirt as favourite
  let(:favourite) { FactoryBot.create(:favourite, user_id: user.id, shirt_id: shirt.id) }

  # We expect the favourite model to have valid attributes
  it 'should have valid attributes' do
    expect(favourite).to be_valid
  end

  # We don't expect the favourite model to miss any attributes
  it 'should not miss any attributes' do
    @favourite = Favourite.create(user_id: nil)
    expect(@favourite).to_not be_valid
  end

  # The favourite model should belong to user
  it { should belong_to(:user).without_validating_presence }

  # The favourite model should also belong to shirt
  it { should belong_to(:shirt).without_validating_presence }
end
