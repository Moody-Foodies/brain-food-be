# class RecipeSerializer
#   def self.serialize(recipes)
#     serialized_recipes = recipes.map do |recipe|
#       {
#         id: recipe.id,
#         type: 'recipe',
#         attributes: {
#           name: recipe.name,
#           time_to_cook: recipe.cook_time,
#           description: recipe.description,
#           nutrient: recipe.nutrient,
#           health_benefits: recipe.health_benefits,
#           image: recipe.image,
#           ingredients: recipe.ingredients,
#           instructions: recipe.instructions
#         }
#       }
#     end

#     { data: serialized_recipes }
#   end
# end

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
