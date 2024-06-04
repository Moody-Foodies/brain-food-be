require "rails_helper"

RSpec.describe "User Dashboard" do
  describe "GET /api/v1/users" do
    before do
      @user = User.create!(name: "John", email: "johannes@example.com", password: "password")
      token = JWT.encode({user_id: @user.id}, ENV['BRAIN_FOOD_SECRET'])
      @headers = {"CONTENT_TYPE" => "application/json", "Authorization" => "Bearer #{token}"}
    end

    it 'should return users favorite recipes and user moods', :vcr do
      get "/api/v1/users", headers: @headers

      expect(response).to be_successful

      dashboard_response = JSON.parse(response.body, symbolize_names: true)

      expect(dashboard_response).to have_key(:data)
      expect(dashboard_response[:data]).to be_a(Hash)

      expect(dashboard_response[:data]).to have_key(:id)
      expect(dashboard_response[:data][:id]).to eq(@user.id.to_s)

      expect(dashboard_response[:data]).to have_key(:type)
      expect(dashboard_response[:data][:type]).to eq("user")

      expect(dashboard_response[:data]).to have_key(:attributes)
      expect(dashboard_response[:data][:attributes]).to be_a(Hash)

      expect(dashboard_response[:data][:attributes]).to have_key(:name)
      expect(dashboard_response[:data][:attributes][:name]).to eq(@user.name)

      expect(dashboard_response[:data][:attributes]).to have_key(:moods)
      expect(dashboard_response[:data][:attributes][:moods]).to be_a(Hash)

      expect(dashboard_response[:data][:attributes][:moods][:avg_mood]).to eq(0)
      expect(dashboard_response[:data][:attributes][:moods][:user_moods]).to eq([])

      expect(dashboard_response[:data][:attributes]).to have_key(:recipes)
      expect(dashboard_response[:data][:attributes][:recipes]).to eq([])
    end
  end
end