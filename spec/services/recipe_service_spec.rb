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
            cook_time: 25,
            description: "Magnesium rich recipe to help your current mood",
            id: 1,
            image: "https://edamam-product-images.s3.amazonaws.com/web-img/6b3/6b33fc39a8d1cd96caffb870e53001fd-l.JPG?X-Amz-Security-Token=IQoJb3JpZ2luX2VjECUaCXVzLWVhc3QtMSJHMEUCIQDmzClku2qR2Ldu4xRWuCrV7cR%2FMP2B8qamn%2Bs80iyg%2FgIgIF1pXpjQu2y8Ylbu22xSDMSqOyG9g4MCFjtI0uCPzE8qwgUIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDF3MW9tvHOJWJ4BJMiqWBZmOZgThZ5LjVdCuCMbDrG2MMAWz8%2F0BwpJSUq9DOgjNHH8n5H9HXPC11hb2uvYzOzMv5G6R0n4UxLdfEOjP24Po9swyHmEqwXD4Kjj2jp0sz3NFGtbDnLeJcl8XAFY%2BYqwusqBhMKDlRrmiG9ploF4GZ6scUmmdFo6OTn7ZN5DM%2BCXa%2FmTEWHmo4fH1swJzMIhGiW0bQKqaWEGhC9oVg%2Fvt%2B82jazIRxf0%2Fe9O5EffSK8Ug5RHunF9y6KyZx2Nf7RtjIgghY%2FV5UcYoON7mfYZMqEzeni4YLAXpVxWZ1UuHJKlRozr0USWzHpq7mW0M71SkUG7AAdOgahpYFInGcKbqWHy%2B3YVmzyVlgMnkc%2BAF85cT8NhLuUFapL4bCl2yGhwdQ8nfMX6ufWmIkPSqZiba5hy8tIZ7lSENYy5aOnME8ZNpbB929Z6WLPvpc1NvBmzL%2FqyNmbaN583a0gcqt57vLq%2Byi6ucOaKxDxMGXkHAJmTsuLmsO5dG0Dac9DirrUAuU%2FQTUv1CSb2xXcVli4OjTL0AOAjqfotCj1qfWycnH2ltLXmxE8xXubZePrT%2FLsvY5VKaTWr2qzIOEyz94e7iGjVSsdafg4AwiW7JPOajNAJN8ps1tzHdZURUCgjreQJU6gtQXfSBGlM%2BkVj2aad0lkIkaQl4c5jEYY4PTJdLzlJG5sbPTQcg9IYwNNjDIWu3d3xix7TKulOy7eKfyhnDmAOGy4lCj3FGV7EpL21kfgITX8sjeSh33N4xpcKsUvTNvQqs4ZKPyrHiJpQCv6EP5OeKtTmZwro7H5ypRN8KovHVv82XLJgYIGDmM1wOhEehcWvysDjSxu5KATACyPcnB73fuW01EhGvY9c3%2BJE5ucZ9hd0hMLT3%2FbIGOrEB9qa3JPGPKkAQp3Wly2t2XntAmMSm6ivXWLjpgiQj62AJi2j3Nk9dgHoBLEpOx6uczhbVZ2C8DdFFzqPXRfZrrd2PZ2OevkkSASJm7oKBtQaEJb6qjNRJfBwPW6RyKmQ9EClJDetcFGgVLEYlcQ2ZIhsTt5ieLmrAWsIVpNRenDDzYEtJuZdbpTldYXjwF%2BXk%2BO2X0KWH37JOtp5ox4fmlTZ6aTRuK%2BYf1uH2rX9sOVEl&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240604T222549Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFNAIGQB6U%2F20240604%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=a3dcb644e5d6ecbdfe85fe603cb3de5b5dbbe799f32bcae53231476d23f46243",
            ingredients: [
                "2 1/2 cups (8.8 ounces; 250g) lafun flour (see note)",
                "4 cups (960ml) boiling water, divided, plus more as needed"
            ],
            instructions: [
                "Using a fine mesh strainer, sift lafun flour into a 3-quart saucier or saucepan; discard any fibrous matter left in the strainer. Add 2 cups (480ml) boiling water and, using a wooden spoon, stir until well combined and a rough dough has formed, about 2 minutes.",
                "Set saucepan over medium-low heat, and cook, stirring and scraping bottom in a circular motion, until no lumps remain, 1 to 2 minutes. Add 1 cup (240ml) boiling water and stir until dough changes from creamy and opaque to more translucent, 5 to 10 minutes.",
                "Reduce heat to low. Spread dough roughly across bottom of saucepan, poke 3 or 4 1-inch-wide holes in it with a wooden spoon, and pour remaining 1 cup (240ml) boiling water on top of dough. Immediately cover and cook until most, if not all, of the water is absorbed, about 3 minutes.",
                "Uncover and continue to cook, stirring constantly, until lafun is soft yet firm, smooth, and stretchy, about 3 minutes (it should not be runny or sticky). If it’s too loose, add sifted lafun flour, 1/4 cup at a time, until lafun is desired consistency. If it’s too firm, add boiling water, 1 tablespoon at a time, until lafun is desired consistency.",
                "To serve, dip a spoon into water and scoop 1/2 cup portions onto individual plates or bowls. Serve lafun immediately with Nigerian soups like egusi."
            ],
            title: "Nigerian Lafun"
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
