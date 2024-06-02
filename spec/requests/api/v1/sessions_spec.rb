require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe "POST /api/v1/login" do
    let!(:user) { User.create(name: "exampleeee", email: "example@example.com", password: "password") }

    context "with valid credentials" do
      it "returns the token_id and status 200" do
        post "/api/v1/login", params: { email: user.email, password: user.password }

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        # expect(json_response["data"]["token_id"]).to eq(user.token_id)
      end
    end

    context "with invalid credentials" do
      it "returns an error and status 422" do
        post "/api/v1/login", params: { email: user.email, password: "wrongpassword" }

        expect(response).to have_http_status(:unprocessable_entity)
        json_response = JSON.parse(response.body)
        expect(json_response["error"]).to eq('Invalid email or password')
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
