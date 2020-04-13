class CreateCookingEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :cooking_entries do |t|
      t.datetime :date
      t.string :meal_category
      t.integer :rating
      t.string :review
      t.integer :recipe_id
      t.integer :chef_id

      t.timestamps
    end
  end
end
