require 'faker'

Chef.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
CookingEntry.destroy_all
CookingStep.destroy_all

meal_categories = ["Appetizer", "Entrée", "Dessert", "Side", "Beverage"]

5.times do
    Chef.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email_address: Faker::Internet.safe_email, password_digest: Faker::Lorem.characters(number: 10))

    Recipe.create(title: Faker::Food.dish, chef_id: Chef.all.sample.id)

    Ingredient.create(name: Faker::Food.ingredient, quantity: Faker::Food.measurement)

    RecipeIngredient.create(recipe_id: Recipe.all.sample.id, ingredient_id: Ingredient.all.sample.id)

    CookingEntry.create(date: Faker::Date.backward(days: 30), meal_category: meal_categories.sample, rating: Faker::Number.between(from: 1, to: 5), review: Faker::Lorem.paragraph, recipe_id: Recipe.all.sample.id, chef_id: Chef.all.sample.id)

    CookingStep.create(recipe_id: Recipe.all.sample.id, content: Faker::Lorem.paragraph)
end

# recipe = Recipe.first
# recipe.cooking_steps_attributes = { "0" => {"content" => "Chop all the ingredients."}, "1" => {"content" => "Sautée the aromatics over high heat."} }
# recipe.save

# step_one = CookingStep.create(recipe_id: Recipe.last.id, content: "Mince all the garlic and onions.")

# recipe.ingredients_attributes={"0"=>{"name"=>"green onions", "quantity"=>"1 cup"}, "1"=>{"name"=>"cheddar cheese", "quantity"=>"1/2 cup"}}