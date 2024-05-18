## Setup

### Prerequisites
- Ruby (version >= 2.5.0)
- Rails (version >= 5.2.0)
- PostgreSQL

### Installation
1. Clone the repository:

    ```bash
    git clone <repository_url>
    ```

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Set up the database:

    ```bash
    rails db:setup
    ```

## Usage
- Start the server:

    ```bash
    rails server
    ```

- Access the API endpoints via http://localhost:3000/api/v1/

## Endpoints

### POST /api/v1/recipes
- Request: 
```json
{
  "user_id": 1,
  "mood": 3,
  "time_available": 45
}
```

- Response: 
```json
{
    "data": [
        {
            "id": 123,
            "type": "recipe",
            "attributes": {
                "name": "Red Lentil Soup with Chicken and Turnips",
                "description": "This food is good because of its taste",
                "time_to_cook": 45,
                "nutrient": "Magnesium",
                "health_benefits": "This will make you way less sad because of the way that it is",
                "image": "https://img.spoonacular.com/recipes/715415-312x231.jpg",
                "ingredients": [
                    "3 medium carrots, peeled and diced",
                    "3 celery stalks, diced",
                    "2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)",
                    "½ cup flat leaf Italian parsley, chopped (plus extra for garnish)",
                    "6 cloves of garlic, finely minced",
                    "2 tablespoons olive oil",
                    "28 ounce-can plum tomatoes, drained and rinsed, chopped",
                    "2 cups dried red lentils, rinsed",
                    "salt and black pepper, to taste",
                    "1 large turnip, peeled and diced",
                    "8 cups vegetable stock",
                    "1 medium yellow onion, diced"
                    ],
                "instructions": [
                    "To a large dutch oven or soup pot, heat the olive oil over medium heat.",
                    "Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.",
                    "Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and red lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.",
                    "Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.",
                    "Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!"
                ] 
            }
        },
        {
            "id": 124,
            "type": "recipe",
            "attributes": {
                "name": "Green Lentil Soup with Chicken and Turnips",
                "description": "This food is good because of its taste",
                "time_to_cook": 45,
                "nutrient": "Magnesium",
                "health_benefits": "This will make you way less sad because of the way that it is",
                "image": "https://img.spoonacular.com/recipes/715415-312x231.jpg",
                "ingredients": [
                    "3 medium carrots, peeled and diced",
                    "3 celery stalks, diced",
                    "2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)",
                    "½ cup flat leaf Italian parsley, chopped (plus extra for garnish)",
                    "6 cloves of garlic, finely minced",
                    "2 tablespoons olive oil",
                    "28 ounce-can plum tomatoes, drained and rinsed, chopped",
                    "2 cups dried green lentils, rinsed",
                    "salt and black pepper, to taste",
                    "1 large turnip, peeled and diced",
                    "8 cups vegetable stock",
                    "1 medium yellow onion, diced"
                ],
                "instructions": [
                    "To a large dutch oven or soup pot, heat the olive oil over medium heat.",
                    "Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.",
                    "Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and green lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.",
                    "Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.",
                    "Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!"
                ]
            }
        },
        {
            "id": 125,
            "type": "recipe",
            "attributes": {
                "name": "Blue Lentil Soup with Chicken and Turnips",
                "description": "This food is good because of its taste",
                "time_to_cook": 45,
                "nutrient": "Magnesium",
                "health_benefits": "This will make you way less sad because of the way that it is",
                "image": "https://img.spoonacular.com/recipes/715415-312x231.jpg",
                "ingredients": [
                    "3 medium carrots, peeled and diced",
                    "3 celery stalks, diced",
                    "2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)",
                    "½ cup flat leaf Italian parsley, chopped (plus extra for garnish)",
                    "6 cloves of garlic, finely minced",
                    "2 tablespoons olive oil",
                    "28 ounce-can plum tomatoes, drained and rinsed, chopped",
                    "2 cups dried green lentils, rinsed",
                    "salt and black pepper, to taste",
                    "1 large turnip, peeled and diced",
                    "8 cups vegetable stock",
                    "1 medium yellow onion, diced"
                ],
                "instructions": [
                    "To a large dutch oven or soup pot, heat the olive oil over medium heat.",
                    "Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.",
                    "Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and green lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.",
                    "Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.",
                    "Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!"
                ]
            }
        },
        {
            "id": 131,
            "type": "recipe",
            "attributes": {
                "name": "Maroon Lentil Soup with Chicken and Turnips",
                "description": "This food is good because of its taste",
                "time_to_cook": 45,
                "nutrient": "Magnesium",
                "health_benefits": "This will make you way less sad because of the way that it is",
                "image": "https://img.spoonacular.com/recipes/715415-312x231.jpg",
                "ingredients": [
                    "3 medium carrots, peeled and diced",
                    "3 celery stalks, diced",
                    "2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)",
                    "½ cup flat leaf Italian parsley, chopped (plus extra for garnish)",
                    "6 cloves of garlic, finely minced",
                    "2 tablespoons olive oil",
                    "28 ounce-can plum tomatoes, drained and rinsed, chopped",
                    "2 cups dried green lentils, rinsed",
                    "salt and black pepper, to taste",
                    "1 large turnip, peeled and diced",
                    "8 cups vegetable stock",
                    "1 medium yellow onion, diced"
                ],
                "instructions": [
                    "To a large dutch oven or soup pot, heat the olive oil over medium heat.",
                    "Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.",
                    "Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and green lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.",
                    "Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.",
                    "Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!"
                ]
            }
        }
    ]
}
```

### POST /api/v1/recipes/favorites
- Request: 
```json
{
    "id": 123,
    "type": "recipe",
    "attributes": {
        "name": "Red Lentil Soup with Chicken and Turnips",
        "description": "This food is good because of its taste",
        "time_to_cook": 45,
        "nutrient": "Magnesium",
        "health_benefits": "This will make you way less sad because of the way that it is",
        "image": "https://img.spoonacular.com/recipes/715415-312x231.jpg",
        "ingredients": [
            "3 medium carrots, peeled and diced",
            "3 celery stalks, diced",
            "2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)",
            "½ cup flat leaf Italian parsley, chopped (plus extra for garnish)",
            "6 cloves of garlic, finely minced",
            "2 tablespoons olive oil",
            "28 ounce-can plum tomatoes, drained and rinsed, chopped",
            "2 cups dried red lentils, rinsed",
            "salt and black pepper, to taste",
            "1 large turnip, peeled and diced",
            "8 cups vegetable stock",
            "1 medium yellow onion, diced"
            ],
        "instructions": [
            "To a large dutch oven or soup pot, heat the olive oil over medium heat.",
            "Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.",
            "Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and red lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.",
            "Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.",
            "Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!"
        ] 
    },
    "user_id": 1
}
```

- Response: 
 No Content - 201 Created


### GET /api/v1/recipes/favorites?user_id=<user_id>
- Response:
```json
{
    "data": [
        {
            "id": 123,
            "type": "recipe",
            "attributes": {
                "name": "Red Lentil Soup with Chicken and Turnips",
                "description": "This food is good because of its taste",
                "time_to_cook": 45,
                "nutrient": "Magnesium",
                "health_benefits": "This will make you way less sad because of the way that it is",
                "image": "https://img.spoonacular.com/recipes/715415-312x231.jpg",
                "ingredients": [
                    "3 medium carrots, peeled and diced",
                    "3 celery stalks, diced",
                    "2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)",
                    "½ cup flat leaf Italian parsley, chopped (plus extra for garnish)",
                    "6 cloves of garlic, finely minced",
                    "2 tablespoons olive oil",
                    "28 ounce-can plum tomatoes, drained and rinsed, chopped",
                    "2 cups dried red lentils, rinsed",
                    "salt and black pepper, to taste",
                    "1 large turnip, peeled and diced",
                    "8 cups vegetable stock",
                    "1 medium yellow onion, diced"
                    ],
                "instructions": [
                    "To a large dutch oven or soup pot, heat the olive oil over medium heat.",
                    "Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.",
                    "Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and red lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.",
                    "Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.",
                    "Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!"
                ] 
            },
            "user_id": 1
        },
        {
            "id": 124,
            "type": "recipe",
            "attributes": {
                "name": "Green Lentil Soup with Chicken and Turnips",
                "description": "This food is good because of its taste",
                "time_to_cook": 45,
                "nutrient": "Magnesium",
                "health_benefits": "This will make you way less sad because of the way that it is",
                "image": "https://img.spoonacular.com/recipes/715415-312x231.jpg",
                "ingredients": [
                    "3 medium carrots, peeled and diced",
                    "3 celery stalks, diced",
                    "2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)",
                    "½ cup flat leaf Italian parsley, chopped (plus extra for garnish)",
                    "6 cloves of garlic, finely minced",
                    "2 tablespoons olive oil",
                    "28 ounce-can plum tomatoes, drained and rinsed, chopped",
                    "2 cups dried green lentils, rinsed",
                    "salt and black pepper, to taste",
                    "1 large turnip, peeled and diced",
                    "8 cups vegetable stock",
                    "1 medium yellow onion, diced"
                ],
                "instructions": [
                    "To a large dutch oven or soup pot, heat the olive oil over medium heat.",
                    "Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.",
                    "Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and green lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.",
                    "Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.",
                    "Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!"
                ]
            },
            "user_id": 1
        },
        {
            "id": 125,
            "type": "recipe",
            "attributes": {
                "name": "Blue Lentil Soup with Chicken and Turnips",
                "description": "This food is good because of its taste",
                "time_to_cook": 45,
                "nutrient": "Magnesium",
                "health_benefits": "This will make you way less sad because of the way that it is",
                "image": "https://img.spoonacular.com/recipes/715415-312x231.jpg",
                "ingredients": [
                    "3 medium carrots, peeled and diced",
                    "3 celery stalks, diced",
                    "2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)",
                    "½ cup flat leaf Italian parsley, chopped (plus extra for garnish)",
                    "6 cloves of garlic, finely minced",
                    "2 tablespoons olive oil",
                    "28 ounce-can plum tomatoes, drained and rinsed, chopped",
                    "2 cups dried green lentils, rinsed",
                    "salt and black pepper, to taste",
                    "1 large turnip, peeled and diced",
                    "8 cups vegetable stock",
                    "1 medium yellow onion, diced"
                ],
                "instructions": [
                    "To a large dutch oven or soup pot, heat the olive oil over medium heat.",
                    "Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.",
                    "Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and green lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.",
                    "Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.",
                    "Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!"
                ]
            },
            "user_id": 1
        },
        {
            "id": 131,
            "type": "recipe",
            "attributes": {
                "name": "Maroon Lentil Soup with Chicken and Turnips",
                "description": "This food is good because of its taste",
                "time_to_cook": 45,
                "nutrient": "Magnesium",
                "health_benefits": "This will make you way less sad because of the way that it is",
                "image": "https://img.spoonacular.com/recipes/715415-312x231.jpg",
                "ingredients": [
                    "3 medium carrots, peeled and diced",
                    "3 celery stalks, diced",
                    "2 cups fully-cooked chicken breast, shredded (may be omitted for a vegetarian version)",
                    "½ cup flat leaf Italian parsley, chopped (plus extra for garnish)",
                    "6 cloves of garlic, finely minced",
                    "2 tablespoons olive oil",
                    "28 ounce-can plum tomatoes, drained and rinsed, chopped",
                    "2 cups dried green lentils, rinsed",
                    "salt and black pepper, to taste",
                    "1 large turnip, peeled and diced",
                    "8 cups vegetable stock",
                    "1 medium yellow onion, diced"
                ],
                "instructions": [
                    "To a large dutch oven or soup pot, heat the olive oil over medium heat.",
                    "Add the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.",
                    "Add the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and green lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.",
                    "Add the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.",
                    "Serve the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!"
                ]
            },
            "user_id": 1
        }
    ]
}
```
- status: 200



## Testing
This project includes automated tests written with RSpec. To run the tests, execute the following command:

```bash
bundle exec rspec
```

## Contributing
Contributions are welcome! Feel free to open issues or pull requests.

## License
This project is licensed under the MIT License.

