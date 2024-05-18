require 'rails_helper'

RSpec.describe FavoritesService do
  before(:each) do
    @service = FavoritesService
    stub_request(:delete, "https://recipes-service-be-27616f8124c6.herokuapp.com/api/v1/favorite_recipes")
      .to_return(status: 202, body: JSON.generate({})) 
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
  end
end