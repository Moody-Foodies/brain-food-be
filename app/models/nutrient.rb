class Nutrient < ApplicationRecord
  validates :name, presence: true
  validates :health_benefits, presence: true
end
