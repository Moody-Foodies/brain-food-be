require 'rails_helper'

RSpec.describe Nutrient, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:health_benefits) }
  end
end
