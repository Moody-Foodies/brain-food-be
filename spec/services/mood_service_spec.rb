require "rails_helper"

RSpec.describe "Mood Service" do
  xit 'create_user_mood' do
    mood = MoodService.new.create_user_mood({ "user_id": 1, "mood": 1 })

    expect(mood.status).to eq(201)
    expect(mood.body).to eq('')
  end
end