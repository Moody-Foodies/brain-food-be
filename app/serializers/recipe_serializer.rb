class RecipeSerializer
  include JSONAPI::Serializer

  attribute :id
  attribute :type do
    'recipe'
  end
  attribute :name
  attribute :time_to_cook
  attribute :description
  attribute :nutrient
  attribute :health_benefits
  attribute :image
  attribute :ingredients
  attribute :instructions
end
