require 'rails_helper'

RSpec.describe "Api::V1::RecipesController", type: :request do
  describe "POST /api/v1/recipes" do
    let(:mood) { 5 }
    let(:time_available) { 60 }
    let(:user_id) { 1 }
    let(:body) { { mood: mood, time_available: time_available, user_id: user_id } }
    let!(:nutrient) do
      Nutrient.create(
        id: 5,
        name: 'Magnesium',
        health_benefits: 'Info: Magnesium can provide benefits to the prevention and slowing of progression of things like Alzheimer’s, stroke, diabetes, hypertension, ADHD, and central nervous system functions. It has a protective effect against things like overstimulation that leads to neuronal cell death, and its relationship with the limbic system is thought to affect the formation and progression of depression. Magnesium intake has proven to be effective at reducing the risk of depression and has been associated with lower levels of anxiety in women. Sources: https://www.sciencedirect.com/science/article/pii/S0531556522003813'
      )
    end

    before do
      stub_request(:post, "http://127.0.0.1:5000/api/v1/moods").
         with(
           body: "{\"user_id\":1,\"mood\":5}",
           headers: {
          'Accept'=>'application/json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: "", headers: {})

      json_response = File.read("spec/fixtures/get_recipes_from_service.json")
      stub_request(:get, "https://7a97657d-b4dd-468a-960b-563f46161622.mock.pstmn.io/recipes?cook_time=60&nutrient=Magnesium").
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

    it "returns recipes with the expected format" do
      post "/api/v1/recipes", params: body

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
