class UserFacade
  def initialize(user_id)
    @user_id = user_id
  end

  def get_dashboard
    recipes = FavoritesService.get_favorite_recipes(@user_id)
    moods = MoodService.new.get_moods(@user_id)
    {
      recipes: recipes,
      moods: moods
    }
  end
end