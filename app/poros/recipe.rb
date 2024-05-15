class Recipe
  attr_reader :id, :image, :time_to_cook, :ingredients, :instructions, :name, :health_benefits, :nutrient, :description

  def initialize(data,nutrient)
    @id = data[:id]
    @name = data[:title]
    @image = data[:image]
    @ingredients = data[:ingredients].map { |ingredient| ingredient[:original] }
    @instructions = data[:instructions].first[:steps].map { |step| step[:step] }
    @health_benefits = nutrient.health_benefits
    @nutrient = nutrient.name
    @description = data[:description]
    @time_to_cook = data[:cook_time]
  end
end
