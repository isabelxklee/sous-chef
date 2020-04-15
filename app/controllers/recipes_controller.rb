class RecipesController < ApplicationController
    before_action :check_to_see_if_someones_logged_in
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    # def ingredient_attributes=(ingredient)
    #     self.ingredient = Ingredient.find_or_create_byśname: ingredient[:name], quantity: ingredient[:quantity])
    #     self.ingredient.update(ingredient)
    # end

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new

        # allow the user to only add one ingredient and cooking step
        # AND THEN, display a form on the recipe show page that allows the user to add more ingredients and cooking steps
        # AND THEN, update the recipe page

    end

    def create
        @recipe = @logged_in_chef.recipes.create(recipe_params)
        @recipe.update(meal_category: params[:meal_category])
        if @recipe.valid?
            redirect_to @recipe
        else
            flash[:errors] = @recipe.errors.full_messages
            redirect_to new_recipe_path
        end
    end

    def show
    end

    def edit
    end

    def update
        @recipe.update(recipe_params)
        redirect_to @recipe
    end

    def destroy
        @recipe.destroy
        redirect_to @recipe.chef
    end

    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:title, :chef_id, :meal_category, ingredients_attributes: [:name, :quantity], cooking_steps_attributes: [:content])
    end
end
