require 'rails_helper'

RSpec.describe FavoriteRecipesFacade do
  describe '#create_favorite_recipe' do
    let(:recipe_details) do
      {
        id: 123,
        type: 'recipe',
        user_id: 1,
        attributes: {
          name: 'Green Lentil Soup with Chicken and Turnips',
          description: 'This food is good because of its taste',
          time_to_cook: 45,
          nutrient: 'Magnesium',
          health_benefits: 'This will make you way less sad because of the way that it is',
          image: 'https://img.spoonacular.com/recipes/715415-312x231.jpg',
          ingredients: ['3 medium carrots, peeled and diced', '3 celery stalks, diced', '2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)', '½ cup flat leaf Italian parsley, chopped (plus extra for garnish)', '6 cloves of garlic, finely minced', '2 tablespoons olive oil', '28 ounce-can plum tomatoes, drained and rinsed, chopped', '2 cups dried green lentils, rinsed', 'salt and black pepper, to taste', '1 large turnip, peeled and diced', '8 cups vegetable stock', '1 medium yellow onion, diced'],
          instructions: ['To a large dutch oven or soup pot, heat the olive oil over medium heat.', 'Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.', 'Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and green lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.', 'Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.', 'Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!']
        }
      }
    end

    let(:service) { instance_double(FavoriteRecipesService) }
    let(:response) { { success: true } }

    before do
      allow(FavoriteRecipesService).to receive(:new).and_return(service)
      allow(service).to receive(:create_recipe).and_return(response)
    end

    it 'calls the FavoriteRecipesService to create a recipe' do
      facade = FavoriteRecipesFacade.new(recipe_details)
      result = facade.create_favorite_recipe

      expect(FavoriteRecipesService).to have_received(:new)
      expect(service).to have_received(:create_recipe).with(recipe_details)
      expect(result).to eq(response)
    end
  end
end
