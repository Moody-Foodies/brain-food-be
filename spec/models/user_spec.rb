require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "callbacks" do
    it "generates a token_id before creation" do
      user = User.new(name: "Test User", email: "test@example.com", password: "password")
      expect(user.token_id).to be_nil
      user.save
      expect(user.token_id).not_to be_nil
      expect(user.token_id.length).to eq(20) # Since SecureRandom.hex(10) generates a 20-character string
    end
  end

  describe "password security" do
    it "requires password on create" do
      user = User.new(name: "Test User", email: "test@example.com")
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "authenticates with correct password" do
      user = User.create!(name: "Test User", email: "test@example.com", password: "password")
      expect(user.authenticate("password")).to eq(user)
    end

    it "does not authenticate with incorrect password" do
      user = User.create!(name: "Test User", email: "test@example.com", password: "password")
      expect(user.authenticate("wrong_password")).to be_falsey
    end
  end
end
