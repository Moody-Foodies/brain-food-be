require 'rails_helper'

RSpec.describe "Delete Favorite Recipe via HTTP Request" do
  before(:each) do
    user = User.create(name: 'Joe', email: 'joe@example.com', password: 'password')
    token = JWT.encode({user_id: user.id}, "brain_food_secret")
    @headers = {"CONTENT_TYPE" => "application/json", "Authorization" => "Bearer #{token}"}
    @body = {user_id: 1, recipe_id: 123}
    @bad_body_1 = {user_id: 1}
    @bad_body_2 = {user_id: 2, recipe_id: 123}
  end

  describe '#happy path' do
    it 'can return the right response status when recieving a delete request' do
      stub_request(:delete, "https://favorite-recipes-service-7d6cb7e82492.herokuapp.com/api/v1/favorite_recipes")
        .to_return(status: 202, body: JSON.generate({}))

      delete "/api/v1/recipes/favorites", headers: @headers, params: JSON.generate(@body)

      expect(response).to be_successful
      expect(response.status).to eq(202)
    end
  end

  describe '#sad path' do
    it 'will return the correct error message if body of request is missing info' do
      json_response = File.read("spec/fixtures/delete_recipe_bad_request.json")
      stub_request(:delete, "https://favorite-recipes-service-7d6cb7e82492.herokuapp.com/api/v1/favorite_recipes")
        .to_return(status: 422, body: json_response)

      delete "/api/v1/recipes/favorites", headers: @headers, params: JSON.generate(@bad_body_1)

      expect(response).not_to be_successful
      expect(response.status).to eq(422)
    end

    it 'will return the correct error message if no record with that informatino exists in the api' do
      json_response = File.read("spec/fixtures/delete_recipe_not_found.json")
      stub_request(:delete, "https://favorite-recipes-service-7d6cb7e82492.herokuapp.com/api/v1/favorite_recipes")
        .to_return(status: 404, body: json_response)

      delete "/api/v1/recipes/favorites", headers: @headers, params: JSON.generate(@bad_body_2)

      expect(response).not_to be_successful
      expect(response.status).to eq(404)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key(:errors)
      expect(result[:errors]).to be_a(Hash)
      expect(result[:errors]).to have_key(:detail)
      expect(result[:errors][:detail]).to eq("No favorited recipe found with that combination of user and recipe id.")
    end
  end
end