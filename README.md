<img src="./app/assets/images/brain_food_logo.png" alt="Logo" width="250" height="200" style="display: block; margin-left: auto; margin-right: auto;"></br>

## Brain Food Gateway
- Brain Food Gateway is a Rails application developed to provide a gateway to all of the different services in the Brain Food Organization and provide an interface where the Frontend can access all of its services. This API allows the Frontend to make a request to create, delete, and update an User; to authenticate an User; to retrive a list of recommended recipes for a given mood the user is feeling; to save the recipes users want to quickly access later; And to retrieve all the recipes saved and moods the user experienced.

## Technologies
[![Ruby on Rails](https://img.shields.io/badge/Ruby-darkred.svg?logo=Ruby&logoColor=white)](https://rubyonrails.org/) [![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-red.svg?logo=Ruby%20on%20Rails&logoColor=white)](https://rubyonrails.org/) [![PostgreSQL](https://img.shields.io/badge/PostgreSQL-blue.svg?logo=postgresql&logoColor=fff)](https://www.postgresql.org/) ![Python3](https://img.shields.io/badge/python-3670A0.svg?logo=Python&logoColor=ffdd54) [![Django](https://img.shields.io/badge/Django-darkgreen.svg?logo=django&logoColor=white)](https://www.djangoproject.com/) ![Go](https://img.shields.io/badge/Go-blue.svg?logo=Go&logoColor=White) ![Gin](https://img.shields.io/badge/Gin-mediumblue.svg?logo=Gin&logoColor=white) ![CircleCI Badge](https://img.shields.io/badge/CircleCI-343434?logo=circleci&logoColor=fff&style=flat) ![Docker](https://img.shields.io/badge/Docker-2496ED?logo=Docker&logoColor=fff&style=flat) ![Heroku](https://img.shields.io/badge/Heroku-430098?logo=Heroku&logoColor=fff&style=flat) [![CircleCI](https://dl.circleci.com/status-badge/img/gh/Moody-Foodies/brain-food-be/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Moody-Foodies/brain-food-be/tree/main)


## Table of Contents
- [Setup](#setup)
- [Installation](#installation)
- [Running the Server](#running-the-server)
- [Running Tests](#running-tests)
- [API Endpoints](#api-endpoints)
    - [Sign Up](#sign-up)
    - [Login](#login)
    - [Search for Recipes](#search-for-recipes-based-on-the-mood)
    - [Save Favorite Recipe](#save-favorite-recipe)
    - [Get Favorite Recipes](#get-favorite-recipes)
    - [Delete Favorite Recipe](#delete-favorite-recipe)
    - [Dashboard](#dashboard)
- [Production Site](#production-site)
- [Architecture](#architecture)
    - [Repositories](#repositories)
- [Schema](#schema)
- [Contributors](#contributors)
- [Contributing](#contributing)
- [License](#license)

## Setup

### Prerequisites
- Ruby (version >= 3.1.4)
- Rails (version >= 7.1.3)
- PostgreSQL (version >= 14)

## Installation
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

## Running the server
- Start the server:

    ```bash
    rails server
    ```

- Access the API endpoints via http://localhost:3000/api/v1/

## Testing
- This project includes automated tests written with RSpec. To run the tests, execute the following command:

    ```bash
        bundle exec rspec
    ```

## Api Endpoints

### Sign up
- `POST /api/v1/users` 
- Creates a user
<details>
<summary>- Request Body:</summary>

```json
    {
        "name": "John",
        "email": "jh@example.com",
        "password": "password"
    }
```
</details>

<details>
<summary>- Response Body:</summary>

    ```json
    {
        "data": {
            "id": "1",
            "type": "user",
            "attributes": {
                "name": "Jhon",
                "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2fQ.LRx_6SlAtuB6NakLx6VK9i4o6qDFbncEo6_lWtprJaU"
            }
        }
    }
    ```
</details>

- Once the user has created an account successfully, the token generated will be used to access every other page of the application.

### Login
- `POST /api/v1/login`
<details>
<summary>- Request Body:</summary>

```json
{
    "email": "jh@example.com",
    "password": "password"
}
```
</details>

<details>
<summary>- Response Body:</summary>

```json
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "name": "Jhon",
            "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2fQ.LRx_6SlAtuB6NakLx6VK9i4o6qDFbncEo6_lWtprJaU"
        }
    }
}
```
</details>

- Once the user has authenticated successfully, the token generated will be used to access every other page of the application.

### Search for Recipes based on the mood
- `POST /api/v1/recipes`
- Header Parameter:
    - `Authorization` => `Bearer <token>`
<details>
<summary>- Request Body:</summary>

```json
{
  "user_id": 1,
  "mood": 3,
  "time_available": 45
}
```
</details>

<details>
<summary>- Response Body:</summary>

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
</details>

### Save Favorite Recipe
- `POST /api/v1/recipes/favorites`
- Header Parameter:
    - `Authorization` => `Bearer <token>`
<details>
<summary>- Request Body:</summary>

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
</details>

- Response: 
 No Content - 201 Created


### Get Favorite Recipes
- `GET /api/v1/recipes/favorites?user_id=<user_id>`
- Header Parameter:
    - `Authorization` => `Bearer <token>`

<details>
<summary>- Response Body:</summary>

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
</details>

### Dashboard
- `GET /api/v1/users
- Parameter: `Authorization` => `Bearer <token>`

<details>
<summary>- Response Body:</summary>

```json
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "name": "John",
            "moods": {
                "avg_mood": 3.5,
                "user_moods": [
                    {
                        "date": "2024-06-01",
                        "mood": 3
                    },
                    {
                        "date": "2024-06-02",
                        "mood": 2
                    },
                    {
                        "date": "2024-06-03",
                        "mood": 5
                    }
                ]
            },
            "recipes": [
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
                    }
                }
            ]
        }
    }
}
```
</details>

## Production Site: 
[Brain Food Gateway](https://brain-food-501b641e50fb.herokuapp.com)

## Architecture: 
<img src="./app/assets/images/brain_food_architecture.png" alt="SOA" width="600" height="450"></br>


Brain Food utilizes a contemporary micro-service architecture for a performant and scalable experience.

- Frontend: Built with React, a JavaScript library for constructing interactive UIs. This enables a clean and responsive user experience.
- API Gateway: Implemented in Ruby on Rails. Routes incoming API requests to the appropriate backend service, promoting separation of concerns and maintainability, based on predefined rules. Stores Users and Nutrients
- Mood Backend Services: Stores and calculates average of mood for a user. 
- Favorite Recipes Backend Services: Stores recipes user saved. 
- Recipe Search Service: Golang and Gin Framework. The application can interact with external API "EDAMAM API", enabling access to external data sources and functionalities without reinventing the wheel.
- Database: PostgreSQL serves as the database management system, ensuring secure and reliable data persistence.

In essence, this architecture employs a clear separation between the frontend (React) and backend (Micro-services), with an API Gateway for routing and PostgreSQL for data storage. The integration with external APIs fosters a more extensible application.

### Repositories:
- [Front End](https://github.com/Moody-Foodies/moody-foodies-fe)
- [Mood Service](https://github.com/Moody-Foodies/user_moods_django)
- [Favorite Recipes Service](https://github.com/Moody-Foodies/favorited-recipes-service)
- [Recipe Search Service](https://github.com/Moody-Foodies/recipes-service-be)

## Schema:
<img src="./app/assets/images/brain_food_schema.png" alt="Schema" width="550" height="600">

## Contributors
- [Erin Kelley](https://github.com/kelleyej) - [LinkedIn](https://www.linkedin.com/in/kelleyej/)
- [Faisal Nazari](https://github.com/mfaisalnazari) - [LinkedIn](https://www.linkedin.com/in/mfaisalnazari/)
- [Igor Magalhaes](https://github.com/IgorrMagalhaess) - [LinkedIn](https://www.linkedin.com/in/igorrmagalhaess/)
- [Jack Sweeney](https://github.com/JackCSweeney) - [LinkedIn](https://www.linkedin.com/in/jack-sweeney-024043274/)
- [Laura Long](https://github.com/lalonggone) - [LinkedIn](https://www.linkedin.com/in/lauralonggone/)

## Contributing
Contributions are welcome! Feel free to open issues or pull requests.

## License
This project is licensed under the [MIT License](./LICENSE).

