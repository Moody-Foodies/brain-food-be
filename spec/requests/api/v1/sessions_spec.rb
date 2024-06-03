require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe "POST /api/v1/login" do
    let!(:user) { User.create(name: "exampleeee", email: "example@example.com", password: "password") }

    context "with valid credentials" do
      it "returns the a token and status 200" do
        post "/api/v1/login", params: { email: user.email, password: user.password }

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body, symbolize_names: true)

        expect(json_response).to have_key(:data)
        expect(json_response[:data]).to be_a(Hash)
        
        expect(json_response[:data][:id]).to eq(user.id.to_s)
        expect(json_response[:data][:type]).to eq("user")
        expect(json_response[:data][:attributes]).to be_a(Hash)

        expect(json_response[:data][:attributes][:name]).to eq(user.name)
        expect(json_response[:data][:attributes][:token]).to be_a(String)
      end
    end

    context "with invalid credentials" do
      it "returns an error and status 422" do
        post "/api/v1/login", params: { email: user.email, password: "wrongpassword" }

        expect(response).to have_http_status(:unprocessable_entity)
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:errors].first[:detail]).to eq('Invalid email or password')
      end
    end
  end

  describe "DELETE /api/v1/logout" do
    it "returns a success message and status 200" do
      delete "/api/v1/logout"

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response["data"]["message"]).to eq('Logged out successfully')
    end
  end
end
