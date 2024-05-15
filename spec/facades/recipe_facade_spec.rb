require 'rails_helper'

RSpec.describe RecipeFacade do
  describe '#get_recipe_data' do
    let(:service) { instance_double(RecipeService) }
    let(:nutrient) { instance_double(Nutrient, name: 'Magnesium', health_benefits: 'Some health benefits') }
    let(:details) { { nutrient: nutrient, cook_time: 55 } }

    before do
      allow(RecipeService).to receive(:new).and_return(service)
      allow(service).to receive(:get_recipes).and_return(recipes_response)
    end

    context 'when successful' do
      let(:recipes_response) do
        {
          data: [
            {
              cook_time: 55,
              id: 715415,
              image: 'https://img.spoonacular.com/recipes/715415-312x231.jpg',
              description: 'Great dish for the fall or winter',
              ingredients: [
                { original: 'Ingredient 1' },
                { original: 'Ingredient 2' }
              ],
              instructions: [
                {
                  steps: [
                    { step: 'Instruction 1' }
                  ]
                }
              ],
              title: 'Recipe 1'
            },
            {
              cook_time: 45,
              id: 644387,
              image: 'https://img.spoonacular.com/recipes/644387-312x231.jpg',
              description: 'Another great dish',
              ingredients: [
                { original: 'Ingredient 3' },
                { original: 'Ingredient 4' }
              ],
              instructions: [
                {
                  steps: [
                    { step: 'Instruction 2' }
                  ]
                }
              ],
              title: 'Recipe 2'
            }
          ]
        }
      end

      it 'returns an array of Recipe objects' do
        facade = RecipeFacade.new(details)
        recipes = facade.get_recipe_data

        expect(recipes).to be_an(Array)
        expect(recipes.size).to eq(2)
        expect(recipes.first).to be_a(Recipe)
        expect(recipes.last).to be_a(Recipe)
      end
    end
  end
end
