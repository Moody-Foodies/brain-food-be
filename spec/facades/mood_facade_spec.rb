require "rails_helper"

RSpec.describe "Mood Facade" do
  describe "#initialize" do
    it 'creates a Mood facade object' do
      facade = MoodFacade.new({ "user_id": 1, "mood": 1 })

      expect(facade).to be_an_instance_of(MoodFacade)
    end
  end

  describe "#create_user_mood" do
    it 'calls create_user_mood on service and return nothing on the body', :vcr do
      facade = MoodFacade.new({ "user_id": 1, "mood": 1 }).create_user_mood
      
      expect(facade).to have_key(:user_id)
      expect(facade[:user_id]).to eq(1)
      expect(facade).to have_key(:mood)
      expect(facade[:mood]).to eq(1)
      expect(facade).to have_key(:date)
      expect(facade[:date]).to be_a(String)
      expect(facade).to_not have_key(:error)
    end
  end
end