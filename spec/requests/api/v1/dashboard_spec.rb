require "rails_helper"

RSpec.describe "User Dashboard" do
  describe "GET /api/v1/users" do
    before do
      @user = User.create!(name: "John", email: "johannes@example.com", password: "password")
      token = JWT.encode({user_id: @user.id}, "brain_food_secret")
      @headers = {"CONTENT_TYPE" => "application/json", "Authorization" => "Bearer #{token}"}
    end

    it 'should return users favorite recipes and user moods' do
      get "/api/v1/users", headers: @headers

      expect(response).to be_successful

      dashboard_response = JSON.parse(response.body, symbolize_names: true)
      require 'pry' ; binding.pry
    end
  end
end