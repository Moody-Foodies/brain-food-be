require 'rails_helper'

RSpec.describe FavoritesFacade do
  before(:each) do
    @facade = FavoritesFacade.new
    stub_request(:delete, "https://favorite-recipes-service-7d6cb7e82492.herokuapp.com/api/v1/favorite_recipes")
      .to_return(status: 202, body: JSON.generate({})) 

    @get_facade = FavoritesFacade.new
    @json_response = File.read("spec/fixtures/get_favorite_recipes_request.json")
    stub_request(:get, "https://favorite-recipes-service-7d6cb7e82492.herokuapp.com/api/v1/favorite_recipes?user_id=1")
        .to_return(status: 200, body: @json_response)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@facade).to be_a(FavoritesFacade)
    end
  end

  describe '.class methods' do
    describe '.delete_favorite_recipe' do
      it 'returns the correct info in a JSON response' do
        return_value = FavoritesFacade.new.delete_favorite_recipe("1", "123")

        expect(return_value.body).to eq("{}")
        expect(return_value.status).to eq(202)
      end
    end

    describe '.get_favorite_recipes' do
      it 'returns the correct info in a JSON response' do
        return_value = FavoritesFacade.new.get_favorite_recipes("1")

        expect(return_value).to eq(JSON.parse(@json_response, symbolize_names: true))
      end
    end
  end
end