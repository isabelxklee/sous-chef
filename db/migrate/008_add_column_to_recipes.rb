class AddColumnToRecipes < ActiveRecord::Migration[6.0]
    def change
      add_column :recipes, :meal_category, :string
    end
end