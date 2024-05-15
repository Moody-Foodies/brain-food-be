require 'rails_helper'

RSpec.describe RecipeService do
  describe '#get_recipes' do
    let(:details) { { nutrient: Nutrient.new(name: 'Magnesium'), cook_time: 55 } }

    before do
      allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(
        instance_double(Faraday::Response, body: recipes_response.to_json)
      )
    end

    context 'when successful' do
      let(:recipes_response) do
        [
          {
            cook_time: 55,
            id: 715415,
            image: 'https://img.spoonacular.com/recipes/715415-312x231.jpg',
            description: 'Great dish for the fall or winter',
            ingredients: [
              { original: 'additional toppings: diced avocado, micro greens, chopped basil)' },
              { original: '3 medium carrots, peeled and diced' },
              { original: '3 celery stalks, diced' },
              { original: '2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)' },
              { original: '½ cup flat leaf Italian parsley, chopped (plus extra for garnish)' },
              { original: '6 cloves of garlic, finely minced' },
              { original: '2 tablespoons olive oil' },
              { original: '28 ounce-can plum tomatoes, drained and rinsed, chopped' },
              { original: '2 cups dried red lentils, rinsed' },
              { original: 'salt and black pepper, to taste' },
              { original: '1 large turnip, peeled and diced' },
              { original: '8 cups vegetable stock' },
              { original: '1 medium yellow onion, diced' }
            ],
            instructions: [
              {
                steps: [
                  { step: 'To a large dutch oven or soup pot, heat the olive oil over medium heat.' },
                  { step: 'Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.' },
                  { step: 'Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and red lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.' },
                  { step: 'Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.' },
                  { step: 'Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!' }
                ]
              }
            ],
            title: 'Red Lentil Soup with Chicken and Turnips'
          }
        ]
      end

      it 'returns recipes' do
        service = RecipeService.new
        recipes = service.get_recipes(details)
        expect(recipes).to eq(recipes_response)
      end
    end
  end
end
