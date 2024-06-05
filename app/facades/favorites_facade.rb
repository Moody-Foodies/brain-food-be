class FavoritesFacade
  def initialize
    @favorite_recipes = nil
  end

  def delete_favorite_recipe(user_id, recipe_id)
    FavoritesService.delete_favorite_recipe(user_id, recipe_id)
  end

  def get_favorite_recipes(user_id)
    @favorite_recipes ||= begin
      @favorite_recipes = FavoritesService.get_favorite_recipes(user_id)
    end
  end
end