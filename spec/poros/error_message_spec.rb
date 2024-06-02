require "rails_helper"

RSpec.describe ErrorMessage do
  describe "#initialize" do
    it "should initialize" do
      error_message = ErrorMessage.new("message")

      expect(error_message).to be_an_instance_of ErrorMessage
      expect(error_message.message).to eq("message")
    end
  end
end