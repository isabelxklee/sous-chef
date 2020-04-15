class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :chef_id
      t.string :meal_category

      t.timestamps
    end
  end
end