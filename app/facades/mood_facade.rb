class MoodFacade
  def initialize(mood_details, service = MoodService.new)
    @mood = mood_details.transform_keys(&:to_s)
    @service = service
  end

  def create_user_mood
    user_mood = @service.create_user_mood(@mood)
  end
end