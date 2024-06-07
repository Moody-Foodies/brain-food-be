require "rails_helper"

RSpec.describe "User Facade" do
  describe "#initialize" do
    it 'creates a user facade object', :vcr do
      facade = UserFacade.new(1)

      expect(facade).to be_an_instance_of(UserFacade)
    end
  end

  describe "#get_dashboard" do
    it 'returns the mood and the favorite recipes for a user', :vcr do
      facade = UserFacade.new(1).get_dashboard

      expect(facade).to have_key(:recipes)
      expect(facade[:recipes][:data]).to be_a(Array)

      expect(facade).to have_key(:moods)
      expect(facade[:moods]).to be_a(Hash)

      expect(facade[:moods]).to have_key(:data)
      expect(facade[:moods][:data]).to be_a(Hash)

      expect(facade[:moods][:data]).to have_key(:id)
      expect(facade[:moods][:data][:id]).to eq("1")

      expect(facade[:moods][:data]).to have_key(:type)
      expect(facade[:moods][:data][:type]).to eq("moods")

      expect(facade[:moods][:data]).to have_key(:attributes)
      expect(facade[:moods][:data][:attributes]).to be_a(Hash)

      expect(facade[:moods][:data][:attributes]).to have_key(:avg_mood)
      expect(facade[:moods][:data][:attributes][:avg_mood]).to be_a(Float)

      expect(facade[:moods][:data][:attributes]).to have_key(:user_moods)
      expect(facade[:moods][:data][:attributes][:user_moods]).to be_an(Array)
    end
  end
end