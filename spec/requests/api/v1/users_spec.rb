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
        expect(JSON.parse(response.body)["error"]).to be_present
      end
    end
  end

  describe "PUT /api/v1/users/:id" do
    let!(:user) { User.create(name: "Joe", email: "joe@example.com", password: "password") }

    context "with valid parameters" do
      it "updates the user" do
        put "/api/v1/users/#{user.id}", params: { name: "Ja1 Doe", email: "ja1@example.com", password: "new_password" }

        expect(response).to have_http_status(:ok)
        user.reload
        expect(user.name).to eq("Ja1 Doe")
        expect(user.email).to eq("ja1@example.com")
      end
    end

    context "with invalid parameters" do
      it "returns an error" do
        put "/api/v1/users/#{user.id}", params: { name: "", email: "invalid_email", password: "short" }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)["error"]).to be_present
      end
    end
  end

  describe "DELETE /api/v1/users/:id" do
    let!(:user) { User.create(name: "Joe", email: "joe@example.com", password: "password") }

    it "deletes the user" do
      delete "/api/v1/users/#{user.id}"
      
      expect(response).to have_http_status(:ok)
      expect(User.exists?(user.id)).to be_falsey
      expect(JSON.parse(response.body)["message"]).to eq("User deleted successfully")
    end
  end
end
