require 'rails_helper'

RSpec.describe Shirt, type: :model do
  let(:shirt) do
    FactoryBot.create(:shirt, name: 'no coffee', description: 'the best shirt to have is here', price: 345)
  end

  it 'should have valid attributes' do
    expect(shirt).to be_valid
  end

  it 'should not miss any attributes' do
    @shirt = Shirt.create(name: nil)
    expect(@shirt).to_not be_valid
  end

  it { should have_many(:favourites).without_validating_presence }

  it { should have_many(:users).without_validating_presence }
end
