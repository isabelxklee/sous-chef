class AddColumnToCookingSteps < ActiveRecord::Migration[6.0]
    def change
      add_column :cooking_steps, :recipe_id, :integer
    end
end