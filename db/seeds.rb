require 'faker'

Chef.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
CookingEntry.destroy_all
CookingStep.destroy_all

meal_categories = ["Appetizer", "Entree", "Dessert", "Side", "Snack", "Beverage"]


######### chefs #########
Chef.create(first_name: "Brad", last_name: "Leone", email_address: "brad@bonappetit.com", password_digest: "123456")
Chef.create(first_name: "Sohla", last_name: "El-Waylly", email_address: "sohla@bonappetit.com", password_digest: "123456")
Chef.create(first_name: "Alice", last_name: "Waters", email_address: "alice@chezpanisse.com", password_digest: "123456")
Chef.create(first_name: "Alison", last_name: "Roman", email_address: "alison@roman.com", password_digest: "123456")
Chef.create(first_name: "Julia", last_name: "Child", email_address: "julia@child.com", password_digest: "123456")

######### recipes #########
Recipe.create(title: "Bucatini Carbonara", chef_id: Chef.all.sample.id, meal_category: meal_categories.sample)
Recipe.create(title: "New England Lobster Rolls", chef_id: Chef.all.sample.id, meal_category: meal_categories.sample)
Recipe.create(title: "Grilled Chicken with Lemongrass Sauce", chef_id: Chef.all.sample.id, meal_category: meal_categories.sample)
Recipe.create(title: "Charred Peppers With Lemon Ricotta and Cucumbers", chef_id: Chef.all.sample.id, meal_category: meal_categories.sample)
Recipe.create(title: "Grilled Pork Shoulder Steaks With Herb Salad", chef_id: Chef.all.sample.id, meal_category: meal_categories.sample)

######### ingredients #########
5.times do
    Ingredient.create(name: Faker::Food.ingredient, quantity: Faker::Food.measurement)
    RecipeIngredient.create(recipe_id: Recipe.all.sample.id, ingredient_id: Ingredient.all.sample.id)
end

######### cooking entries #########
CookingEntry.create(date: Faker::Date.backward(days: 30), rating: Faker::Number.between(from: 1, to: 5), review: "This is my new favorite dish. Next time, I would add a pinch of salt though!", recipe_id: Recipe.all.sample.id, chef_id: Chef.all.sample.id)

CookingEntry.create(date: Faker::Date.backward(days: 30), rating: Faker::Number.between(from: 1, to: 5), review: "I accidentally burned the main ingredient and it turned out great anyway! Cook time was a little long though, I would only make this dish if I had a few hours to spare.", recipe_id: Recipe.all.sample.id, chef_id: Chef.all.sample.id)

CookingEntry.create(date: Faker::Date.backward(days: 30), rating: Faker::Number.between(from: 1, to: 5), review: "Super bland, never making this again. Sorry!!!", recipe_id: Recipe.all.sample.id, chef_id: Chef.all.sample.id)

CookingEntry.create(date: Faker::Date.backward(days: 30), rating: Faker::Number.between(from: 1, to: 5), review: "Meh, it was okay. This dish is like pure protein, just think about it like you're feeding yourself.", recipe_id: Recipe.all.sample.id, chef_id: Chef.all.sample.id)

CookingEntry.create(date: Faker::Date.backward(days: 30), rating: Faker::Number.between(from: 1, to: 5), review: "Delightful! Next time I would add twice the amount of spices and add a pinch of garlic salt.", recipe_id: Recipe.all.sample.id, chef_id: Chef.all.sample.id)

######### cooking steps #########
CookingStep.create(recipe_id: Recipe.all.sample.id, content: "Pre-heat the oven to 425 degrees.")
CookingStep.create(recipe_id: Recipe.all.sample.id, content: "Chop all the ingredients.")
CookingStep.create(recipe_id: Recipe.all.sample.id, content: "Sautée the main protein on high heat. Let it rest for 5 minutes after taking out of the pan.")
CookingStep.create(recipe_id: Recipe.all.sample.id, content: "Drizzle on the sauce and serve!")
CookingStep.create(recipe_id: Recipe.all.sample.id, content: "Marinate the protein.")


# 5.times do
#     Chef.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email_address: Faker::Internet.safe_email, password_digest: "123456")

#     Recipe.create(title: Faker::Food.dish, chef_id: Chef.all.sample.id, meal_category: meal_categories.sample)

#     Ingredient.create(name: Faker::Food.ingredient, quantity: Faker::Food.measurement)

#     RecipeIngredient.create(recipe_id: Recipe.all.sample.id, ingredient_id: Ingredient.all.sample.id)

#     CookingEntry.create(date: Faker::Date.backward(days: 30), rating: Faker::Number.between(from: 1, to: 5), review: Faker::Lorem.paragraph, recipe_id: Recipe.all.sample.id, chef_id: Chef.all.sample.id)

#     CookingStep.create(recipe_id: Recipe.all.sample.id, content: Faker::Lorem.paragraph)
# end

# recipe = Recipe.create(title: "Sweet and Spicy Cucumber Salad", chef_id: Chef.all.sample.id, meal_category: "Side")

# recipe.cooking_steps_attributes = { "0" => {"content" => "Thinly slice cilantro stems until you have about 2 Tbsp. and place in a large bowl. Coarsely chop remaining cilantro; set aside for serving."}, "1" => {"content" => "Add shallot, garlic, chiles, tamarind concentrate, lime juice, and fish sauce to bowl with cilantro stems and mix well. Add cucumbers and tomatoes, season with salt, and toss until everything is nicely dressed."}, "2" => {"content" => "Transfer salad to a platter and top with reserved chopped cilantro, then fried shallots and peanuts."} }
# recipe.save

# recipe.ingredients_attributes={"0"=>{"name"=>"cilantro", "quantity"=>"1/2 bunch"}, "1"=>{"name"=>"chopped shallot", "quantity"=>"1"}, "2"=>{"name"=>"garlic clove", "quantity"=>"3"}, "3"=>{"name"=>"thai chiles", "quantity"=>"1"}}
# recipe.save

# CookingEntry.create(date: Faker::Date.backward(days: 30), rating: Faker::Number.between(from: 1, to: 5), review: Faker::Lorem.paragraph, recipe_id: recipe.id, chef_id: Chef.all.sample.id)