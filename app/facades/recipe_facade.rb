class RecipeFacade
  def initialize(details)
    @details = details
  end

  def get_recipe_data
    recipe_info = RecipeService.new.get_recipes(@details)
    recipes = []
    recipe_info[:data].each do |recipe_data|
       recipes << Recipe.new(recipe_data,@details[:nutrient])
    end
    recipes
  end
end