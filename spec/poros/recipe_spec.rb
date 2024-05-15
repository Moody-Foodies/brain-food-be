require 'rails_helper'

RSpec.describe Recipe do
  let(:nutrient) { instance_double(Nutrient, name: 'Magnesium', health_benefits: 'Some health benefits') }
  let(:data) do
    {
      id: 715415,
      title: 'Red Lentil Soup with Chicken and Turnips',
      image: 'https://img.spoonacular.com/recipes/715415-312x231.jpg',
      ingredients: [
        { original: 'additional toppings: diced avocado, micro greens, chopped basil)' },
        { original: '3 medium carrots, peeled and diced' }
      ],
      instructions: [
        {
          steps: [
            { step: 'To a large dutch oven or soup pot, heat the olive oil over medium heat.' }
          ]
        }
      ],
      health_benefits: 'Some health benefits',
      description: 'Great dish for the fall or winter',
      cook_time: 55
    }
  end

  describe '#initialize' do
    it 'creates a new Recipe instance' do
      recipe = Recipe.new(data, nutrient)
      expect(recipe.id).to eq(715415)
      expect(recipe.name).to eq('Red Lentil Soup with Chicken and Turnips')
      expect(recipe.image).to eq('https://img.spoonacular.com/recipes/715415-312x231.jpg')
      expect(recipe.ingredients).to eq(['additional toppings: diced avocado, micro greens, chopped basil)', '3 medium carrots, peeled and diced'])
      expect(recipe.instructions).to eq(['To a large dutch oven or soup pot, heat the olive oil over medium heat.'])
      expect(recipe.health_benefits).to eq('Some health benefits')
      expect(recipe.nutrient).to eq('Magnesium')
      expect(recipe.description).to eq('Great dish for the fall or winter')
      expect(recipe.time_to_cook).to eq(55)
    end
  end
end
