require 'rails_helper'

RSpec.describe FavoritesService do
  before(:each) do
    @service = FavoritesService
    stub_request(:delete, "https://recipes-service-be-27616f8124c6.herokuapp.com/api/v1/favorite_recipes")
      .to_return(status: 202, body: JSON.generate({})) 

    @get_service = FavoritesService
    @json_response = File.read("spec/fixtures/get_favorite_recipes_request.json")
    stub_request(:get, "https://recipes-service-be-27616f8124c6.herokuapp.com/api/v1/favorite_recipes?user_id=1")
        .to_return(status: 200, body: @json_response)
  end

  describe '#initialize' do
    it 'exists' do
      expect(FavoritesService.new).to be_a(FavoritesService)
    end
  end

  describe '.class methods' do
    describe '.conn' do
      it 'creates a faraday connection' do
        expect(@service.conn).to be_a(Faraday::Connection)
      end
    end

    describe '.delete_url(url, body)' do
      it 'will use the connection to make a delete request' do
        result = @service.delete_url("/api/v1/favorite_recipes", {user_id: "1", id: "123"})

        expect(result.env[:method]).to eq(:delete)
      end
    end

    describe '.get_url(url)' do
      it 'will use the connection to make a delete request' do
        result = @service.get_url("/api/v1/favorite_recipes?user_id=1")

        expect(result).to eq(JSON.parse(@json_response, symbolize_names: true))
      end
    end
  end
end