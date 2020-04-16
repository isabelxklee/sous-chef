class RecipesController < ApplicationController
    before_action :check_to_see_if_someones_logged_in
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
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
        @logged_in_chef
    end

    def edit
    end

    def update
        @recipe.update(meal_category: params[:meal_category])
        
        # allow the user to only add one ingredient and cooking step
        # AND THEN, display a form on the recipe show page that allows the user to add more ingredients and cooking steps
        # AND THEN, update the recipe page
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
        params.require(:recipe).permit(:title, :chef_id, :meal_category, ingredients_attributes: [:id, :name, :quantity, :_destroy], cooking_steps_attributes: [:id, :content, :_destroy])
    end
end
