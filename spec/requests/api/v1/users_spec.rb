require 'rails_helper'

RSpec.describe "Api::V1::UsersController", type: :request do
  describe "POST /api/v1/users" do
    context "with valid parameters" do
      it "creates a new user" do
        user_params = { name: "Joe", email: "joe@example.com", password: "password" }

        post "/api/v1/users", params: user_params

        expect(response).to have_http_status(:created)
        expect(User.count).to eq(1)
        expect(User.last.name).to eq("Joe")
        expect(User.last.email).to eq("joe@example.com")
      end
    end

    context "with invalid parameters" do
      it "returns an error" do
        post "/api/v1/users", params: { name: "", email: "invalid_email", password: "short" }

        expect(response).to have_http_status(:unprocessable_entity)
        invalid_response = JSON.parse(response.body, symbolize_names: true)
        expect(invalid_response[:errors].first[:detail].first).to eq("Name can't be blank")
      end
    end
  end

  describe "PUT /api/v1/users/:id" do
    let!(:user) { User.create(name: "Joe", email: "joe@example.com", password: "password") }
    let!(:token) do
      payload = { user_id: user.id }
      JWT.encode(payload, 'brain_food_secret')
    end
    let!(:headers) { { 'Authorization' => "Bearer #{token}" } }

    context "with valid parameters" do
      it "updates the user" do
        put "/api/v1/users/#{user.id}", headers: headers, params: { name: "Ja1 Doe", email: "ja1@example.com", password: "new_password" }

        expect(response).to have_http_status(:ok)
        user.reload
        expect(user.name).to eq("Ja1 Doe")
        expect(user.email).to eq("ja1@example.com")
      end
    end

    context "with invalid parameters" do
      it "returns an error" do
        put "/api/v1/users/#{user.id}", headers: headers, params: { name: "", email: "invalid_email", password: "short" }

        expect(response).to have_http_status(:unprocessable_entity)
        invalid_response = JSON.parse(response.body, symbolize_names: true)
        expect(invalid_response[:errors].first[:detail].first).to eq("Name can't be blank")
      end

      it "returns an error if token passed is with wrong encoding" do
        token = JWT.encode({user_id: 123123}, 'none')
        headers = { 'Authorization' => "Bearer #{token}" } 

        put "/api/v1/users/#{user.id}", headers: headers, params: { name: "JOEY", email: "invalid_email", password: "short" }

        expect(response).to have_http_status(400)
        invalid_response = JSON.parse(response.body, symbolize_names: true)
        expect(invalid_response[:errors].first[:detail]).to eq("Signature verification failed")
      end

      it "returns an error if token passed is returns an non existing user" do
        token = JWT.encode({user_id: 123123}, 'brain_food_secret')
        headers = { 'Authorization' => "Bearer #{token}" } 

        put "/api/v1/users/#{user.id}", headers: headers, params: { name: "JOEY", email: "invalid_email", password: "short" }

        expect(response).to have_http_status(400)
        invalid_response = JSON.parse(response.body, symbolize_names: true)
        expect(invalid_response[:errors].first[:detail]).to eq("Couldn't find User with 'id'=123123")
      end
    end
  end

  describe "DELETE /api/v1/users/:id" do
    let!(:user) { User.create(name: "Joe", email: "joe@example.com", password: "password") }
    let!(:token) do
      payload = { user_id: user.id }
      JWT.encode(payload, 'brain_food_secret')
    end
    let!(:headers) { { 'Authorization' => "Bearer #{token}" } }

    it "deletes the user" do
      delete "/api/v1/users/#{user.id}", headers: headers
      
      expect(response).to have_http_status(204)
      expect(User.exists?(user.id)).to be_falsey
    end
  end
end
