class RemoveColumnFromCookingEntries < ActiveRecord::Migration[6.0]
    def change
        remove_column :cooking_entries, :meal_category, :string
    end
end