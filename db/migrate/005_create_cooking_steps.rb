class CreateCookingSteps < ActiveRecord::Migration[6.0]
    def change
      create_table :cooking_steps do |t|
        t.string :content
        t.integer :recipe_id
  
        t.timestamps
      end
    end
  end