class CreateCookingSteps < ActiveRecord::Migration[6.0]
    def change
      create_table :cooking_steps do |t|
        t.string :content
  
        t.timestamps
      end
    end
  end