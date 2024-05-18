class FavoritesSerializer
  def initialize(favorite_recipes, user_id)
    @favorite_recipes = favorite_recipes
    @user_id = user_id
  end

  def serializable_hash
    {
      data: {
        id: @user_id[:user_id],
        type: "favorite_recipe",
        recipes: @favorite_recipes
      }
    }
  end
end
