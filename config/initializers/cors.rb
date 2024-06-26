# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://127.0.0.1:5173",
            "https://moody-foodies-ogk5j1x4j-moodyfoody.vercel.app/",
            "https://jade-lebkuchen-46144d.netlify.app",
            "https://jade-lebkuchen-46144d.netlify.app/home",
            "https://jade-lebkuchen-46144d.netlify.app/recipes",
            "https://jade-lebkuchen-46144d.netlify.app/dashboard",
            "jade-lebkuchen-46144d.netlify.app",
            "jade-lebkuchen-46144d.netlify.app/home",
            "jade-lebkuchen-46144d.netlify.app/recipes",
            "jade-lebkuchen-46144d.netlify.app/dashboard",
            "http://localhost:3000/"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
