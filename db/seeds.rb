require 'faker'

Chef.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
CookingEntry.destroy_all
CookingStep.destroy_all

meal_categories = ["Appetizer", "Entrée", "Dessert", "Side", "Snack", "Beverage"]

5.times do
    Chef.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email_address: Faker::Internet.safe_email, password_digest: "123456")

    Recipe.create(title: Faker::Food.dish, chef_id: Chef.all.sample.id, meal_category: meal_categories.sample)

    Ingredient.create(name: Faker::Food.ingredient, quantity: Faker::Food.measurement)

    RecipeIngredient.create(recipe_id: Recipe.all.sample.id, ingredient_id: Ingredient.all.sample.id)

    CookingEntry.create(date: Faker::Date.backward(days: 30), rating: Faker::Number.between(from: 1, to: 5), review: Faker::Lorem.paragraph, recipe_id: Recipe.all.sample.id, chef_id: Chef.all.sample.id)

    CookingStep.create(recipe_id: Recipe.all.sample.id, content: Faker::Lorem.paragraph)
end

recipe = Recipe.create(title: "Sweet and Spicy Cucumber Salad", chef_id: Chef.all.sample.id, meal_category: "Side")

recipe.cooking_steps_attributes = { "0" => {"content" => "Thinly slice cilantro stems until you have about 2 Tbsp. and place in a large bowl. Coarsely chop remaining cilantro; set aside for serving."}, "1" => {"content" => "Add shallot, garlic, chiles, tamarind concentrate, lime juice, and fish sauce to bowl with cilantro stems and mix well. Add cucumbers and tomatoes, season with salt, and toss until everything is nicely dressed."}, "2" => {"content" => "Transfer salad to a platter and top with reserved chopped cilantro, then fried shallots and peanuts."} }
recipe.save

recipe.ingredients_attributes={"0"=>{"name"=>"cilantro", "quantity"=>"1/2 bunch"}, "1"=>{"name"=>"chopped shallot", "quantity"=>"1"}, "2"=>{"name"=>"garlic clove", "quantity"=>"3"}, "3"=>{"name"=>"thai chiles", "quantity"=>"1"}}
recipe.save

CookingEntry.create(date: Faker::Date.backward(days: 30), rating: Faker::Number.between(from: 1, to: 5), review: Faker::Lorem.paragraph, recipe_id: recipe.id, chef_id: Chef.all.sample.id)

# recipe = Recipe.create(title: "Bread Pudding", chef_id: Chef.all.sample.id, meal_category: "Side")
# isabel = Chef.find_by(first_name: "isabel")