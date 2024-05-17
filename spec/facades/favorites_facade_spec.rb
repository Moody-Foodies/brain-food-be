require 'rails_helper'

RSpec.describe FavoritesFacade do
  before(:each) do
    @facade = FavoritesFacade.new
    stub_request(:delete, "https://recipes-service-be-27616f8124c6.herokuapp.com/api/v1/favorite_recipes")
      .to_return(status: 202, body: JSON.generate({})) 
  end

  describe '#initialize' do
    it 'exists' do
      expect(@facade).to be_a(FavoritesFacade)
    end
  end

  describe '.class methods' do
    describe '.delete_favorite_recipe' do
      it 'returns the correct info in a JSON response' do
        return_value = FavoritesFacade.delete_favorite_recipe("1", "123")

        expect(return_value.body).to eq("{}")
        expect(return_value.status).to eq(202)
      end
    end
  end
end