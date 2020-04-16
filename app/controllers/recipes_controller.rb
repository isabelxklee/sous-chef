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
        # @recipe.cooking_steps.update(cooking_steps_params)
        # @recipe.ingredients << params[:recipe][:ingredients_attributes]
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

    # def cooking_steps_params
    #     params.require(:cooking_steps).permit(:content)
    # end

    def recipe_params
        params.require(:recipe).permit(:title, :chef_id, :meal_category, ingredients_attributes: [:id, :name, :quantity, :_destroy], cooking_steps_attributes: [:id, :content, :_destroy])
    end
end
