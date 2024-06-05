class UserFacade
  def initialize(user_id)
    @user_id = user_id
    @dashboard = nil
  end

  def get_dashboard
    @dashboard ||= begin
      recipes = FavoritesService.get_favorite_recipes(@user_id)
      moods = MoodService.new.get_moods(@user_id)
      @dashboard = {
        recipes: recipes,
        moods: moods
      }
    end
  end
end