class CookingEntriesController < ApplicationController
    before_action :check_to_see_if_someones_logged_in
    before_action :set_entry, only: [:show, :edit, :update, :delete]

    def show
        convert_time(@entry[:date])
    end

    def new
        other_chefs_recipes
        @entry = CookingEntry.new
        @errors = flash[:errors]
    end

    def create
        @entry = @logged_in_chef.cooking_entries.create(entry_params)
        if @entry.valid?
            redirect_to @entry.chef
        else
            flash[:errors] = @entry.errors.full_messages
            redirect_to new_entry_path
        end
    end

    def edit
        other_chefs_recipes
    end

    def update
        @entry.update(entry_params)
        redirect_to @entry.chef
    end

    def delete
        @entry.destroy
        redirect_to @entry.chef
    end

    private

    def set_entry
        @entry = CookingEntry.find(params[:id])
    end

    def entry_params
        params.require(:cooking_entry).permit(:date, :rating, :chef_id, :recipe_id, :review)
    end

    def convert_time(datetime)
        @date = datetime.strftime("%B %d, %Y")
        @time = datetime.strftime("%I:%M %p")
    end

    def other_chefs_recipes
        @other_recipes = Recipe.all - @logged_in_chef.recipes
    end
end
