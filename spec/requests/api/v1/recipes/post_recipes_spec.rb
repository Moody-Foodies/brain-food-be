require 'rails_helper'
require 'jwt'

RSpec.describe "Api::V1::RecipesController", type: :request do
  describe "POST /api/v1/recipes" do
    let(:user) { User.create!(name: "Joe", email: "joe@example.com", password: "password") }
    let(:mood) { 5 }
    let(:time_available) { 60 }
    let(:user_id) { user.id }
    let(:body) { { mood: mood, time_available: time_available, user_id: user_id } }
    let!(:nutrient) do
      Nutrient.create(
        id: 5,
        name: 'Magnesium',
        health_benefits: 'Info: Magnesium can provide benefits to the prevention and slowing of progression of things like Alzheimer’s, stroke, diabetes, hypertension, ADHD, and central nervous system functions. It has a protective effect against things like overstimulation that leads to neuronal cell death, and its relationship with the limbic system is thought to affect the formation and progression of depression. Magnesium intake has proven to be effective at reducing the risk of depression and has been associated with lower levels of anxiety in women. Sources: https://www.sciencedirect.com/science/article/pii/S0531556522003813'
      )
    end

    let!(:token) do
      payload = { user_id: user.id }
      JWT.encode(payload, 'brain_food_secret')
    end
    let!(:headers) { { 'Authorization' => "Bearer #{token}" } }

    before do
      stub_request(:post, "https://user-moods-73d107f0a7fc.herokuapp.com/api/moods").
        with(
          body: { user_id: user.id, mood: mood }.to_json,
          headers: {
          'Accept'=>'application/json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v2.9.0'
          }).
        to_return(status: 200, body: "", headers: {})

      json_response = File.read("spec/fixtures/get_recipes_from_service.json")
      stub_request(:get, "https://recipes-service-be-27616f8124c6.herokuapp.com/recipes?cook_time=60&nutrient=Magnesium").
        with(
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.9.0'
          }).
        to_return(status: 200, body: json_response, headers: {})
    end

    after do
      nutrient.destroy
    end

    it "returns recipes with the expected format", :vcr do
      post "/api/v1/recipes", headers: headers, params: body

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response).to have_key("data")

      data = json_response["data"]
      expect(data).to be_an(Array)

      recipe = data.first
      expect(recipe["id"]).to eq("715415")
      expect(recipe["type"]).to eq("recipe")
      expect(recipe["attributes"]["id"]).to eq(715415)
      expect(recipe["attributes"]["name"]).to eq("Red Lentil Soup with Chicken and Turnips")
      expect(recipe["attributes"]["time_to_cook"]).to eq(55)
      expect(recipe["attributes"]["ingredients"]).to be_an(Array)
      expect(recipe["attributes"]["instructions"]).to be_an(Array)
    end
  end
end
