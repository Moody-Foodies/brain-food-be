class FavoritesFacade
  def self.delete_favorite_recipe(user_id, recipe_id)
    FavoritesService.delete_favorite_recipe(user_id, recipe_id)
  end
end