class RecipeFacade
  def initialize(details)
    @details = details
    @recipes = nil
  end

  def get_recipe_data
    @recipes ||= begin
      recipe_info = RecipeService.new.get_recipes(@details)
      @recipes = []
      recipe_info[:data].each do |recipe_data|
        @recipes << Recipe.new(recipe_data,@details[:nutrient])
      end
      @recipes
    end
  end
end