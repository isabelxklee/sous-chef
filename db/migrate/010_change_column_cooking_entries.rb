class ChangeColumnCookingEntries < ActiveRecord::Migration[6.0]
    def change
        change_column :cooking_entries, :rating, :string
    end
end