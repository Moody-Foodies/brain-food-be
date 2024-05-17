require 'rails_helper'

RSpec.describe "Api::V1::RecipesController", type: :request do
  describe "POST /api/v1/recipes" do
    let(:mood) { 5 }
    let(:time_available) { 45 }
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
      WebMock.allow_net_connect!

      post "/api/v1/recipes", params: body
    end

    after do
      nutrient.destroy
    end

    it "returns recipes with the expected format" do
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
