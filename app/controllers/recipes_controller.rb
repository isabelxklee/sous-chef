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
    end

    def create
        @recipe = @logged_in_chef.recipes.create(recipe_params)
        if @recipe.valid?
            redirect_to @recipe
        else
            flash[:errors] = @recipe.errors.full_messages
            redirect_to new_recipe_path
        end
        # @recipe = Recipe.create(recipe_params)
        # @logged_in_chef.recipes << @recipe
        # redirect_to @recipe
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
        redirect_to recipes_path
    end

    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:title, :chef_id, ingredients_attributes: [:name, :quantity], cooking_steps_attributes: [:content])
    end
end
