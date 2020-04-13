require 'faker'

Chef.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all

5.times do
    Chef.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email_address: Faker::Internet.safe_email, password_digest: Faker::Lorem.characters(number: 10))
end

recipe = Recipe.create(title: "Quesadilla", chef_id: Chef.first.id)
Ingredient.create(name: "lean ground turkey", quantity: "1 lb.")
recipe_ingredient = RecipeIngredient.create(recipe_id: Recipe.first.id, ingredient_id: Ingredient.last.id)

recipe.ingredients_attributes={"0"=>{"name"=>"green onions", "quantity"=>"1 cup"}, "1"=>{"name"=>"cheddar cheese", "quantity"=>"1/2 cup"}}