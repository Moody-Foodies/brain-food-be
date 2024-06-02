class MoodService
  def conn
    conn = Faraday.new(url: "https://user-moods-73d107f0a7fc.herokuapp.com") do |faraday|
      faraday.headers['Accept'] = 'application/json'
      faraday.request :json
    end
  end

  def create_user_mood(mood_details)
    # we don't actually have a response body so I'm not saving the response in a variable
    conn.post("/api/moods", mood_details)
  end
end