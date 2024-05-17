require "rails_helper"

RSpec.describe "Mood Facade" do
  describe "#initialize" do
    it 'creates a Mood facade object' do
      facade = MoodFacade.new({ "user_id": 1, "mood": 1 })

      expect(facade).to be_an_instance_of(MoodFacade)
    end
  end

  describe "#create_user_mood" do
    it 'calls create_user_mood on service and return nothing on the body' do
      facade = MoodFacade.new({ "user_id": 1, "mood": 1 }).create_user_mood

      expect(facade.status).to eq(201)
      expect(facade.body).to eq("")
    end
  end
end