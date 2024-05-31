require "rails_helper"

RSpec.describe "Get Favorite Recipes", type: :request do
  before do
    @user = User.create!(name: "Igor", email: "igor@example.com", password: "example")
    @headers = { 'Content-Type' => 'application/json'}

  end

  describe "GET api/v1/recipes/favorites" do
    it 'returns all the favorite recipes for the user' do
      json_response = File.read("spec/fixtures/get_favorite_recipes_request.json")
      stub_request(:get, "https://favorite-recipes-service-7d6cb7e82492.herokuapp.com/api/v1/favorite_recipes?user_id=1")
        .to_return(status: 200, body: json_response)

      get "/api/v1/recipes/favorites?user_id=1", headers: @headers

      expect(response).to be_successful
      expect(response.status).to eq(200)

      favorites_response = JSON.parse(response.body, symbolize_names: true)

      expect(favorites_response[:data]).to be_a(Hash)
      expect(favorites_response[:data]).to have_key(:id)
      expect(favorites_response[:data][:id]).to eq(1)
      expect(favorites_response[:data][:type]).to eq("favorite_recipe")
      expect(favorites_response[:data][:recipes]).to be_a(Array)

      recipes = favorites_response[:data][:recipes]

      recipes.each do |recipe|
        expect(recipe).to have_key(:recipe_id)
        expect(recipe[:recipe_id]).to be_a(Integer)

        expect(recipe).to have_key(:type)
        expect(recipe[:type]).to eq("recipe")

        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to be_a(Hash)

        expect(recipe[:attributes]).to have_key(:name)
        expect(recipe[:attributes][:name]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:description)
        expect(recipe[:attributes][:description]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:time_to_cook)
        expect(recipe[:attributes][:time_to_cook]).to be_a(Integer)

        expect(recipe[:attributes]).to have_key(:nutrient)
        expect(recipe[:attributes][:nutrient]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:health_benefits)
        expect(recipe[:attributes][:health_benefits]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes][:image]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:ingredients)
        expect(recipe[:attributes][:ingredients]).to be_a(Array)

        expect(recipe[:attributes]).to have_key(:instructions)
        expect(recipe[:attributes][:instructions]).to be_a(Array)
      end
    end

    it 'returns all the favorite recipes for the user' do
      json_response = File.read("spec/fixtures/get_favorites_bad_request.json")
      stub_request(:get, "https://favorite-recipes-service-7d6cb7e82492.herokuapp.com/api/v1/favorite_recipes")
        .to_return(status: 400, body: json_response)

      get "/api/v1/recipes/favorites", headers: @headers

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      favorites_response = JSON.parse(response.body, symbolize_names: true)
      expect(favorites_response).to eq({
        errors: {
          detail: 'Unable to process request due to missing information'
        }
      })
    end
  end
end