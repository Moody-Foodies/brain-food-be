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
end