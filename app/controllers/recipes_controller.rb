class RecipesController < ApplicationController
    before_action :check_to_see_if_someones_logged_in

    # def ingredient_attributes=(ingredient)
    #     self.ingredient = Ingredient.find_or_create_byśname: ingredient[:name], quantity: ingredient[:quantity])
    #     self.ingredient.update(ingredient)
    # end

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = @logged_in_chef.recipes.create(recipe_params)
        redirect_to @recipe
    end

    def show
        find_recipe
    end

    private
    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:title, :chef_id, ingredients_attributes: [:name, :quantity])
    end
end
