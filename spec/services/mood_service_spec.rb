require "rails_helper"

RSpec.describe MoodService do
  describe "#create_user_mood" do
    it 'creates user_mood', :vcr do
      data = { "user_id": "1", "mood": "1" }
      service = MoodService.new.create_user_mood(data)
      
      expect(service).to have_key(:user_id)
      expect(service[:user_id]).to eq(1)
      expect(service).to have_key(:mood)
      expect(service[:mood]).to eq(1)
      expect(service).to have_key(:date)
    end
  end

  describe "#get_moods" do
    it 'returns user_moods', :vcr do
      user_id = 1
      service = MoodService.new.get_moods(user_id)

      expect(service).to have_key(:data)
      expect(service[:data]).to have_key(:id)
      expect(service[:data][:id]).to eq(user_id.to_s)
      expect(service[:data][:type]).to eq("moods")
      expect(service[:data][:attributes]).to be_a(Hash)
      expect(service[:data][:attributes][:avg_mood]).to be_a(Float)
      expect(service[:data][:attributes][:user_moods]).to be_a(Array)
    end
  end
end