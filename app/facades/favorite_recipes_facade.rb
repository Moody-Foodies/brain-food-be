class FavoriteRecipesFacade
  def initialize(recipe)
    @recipe_details = recipe
  end

  def create_favorite_recipe
    FavoriteRecipesService.new.create_recipe(@recipe_details)
  end
end
