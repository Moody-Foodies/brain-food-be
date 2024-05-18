class FavoritesFacade
  def self.delete_favorite_recipe(user_id, recipe_id)
    FavoritesService.delete_favorite_recipe(user_id, recipe_id)
  end

  def self.get_favorite_recipes(user_id)
    FavoritesService.get_favorite_recipes(user_id)
  end
end