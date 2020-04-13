class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :chef_id
      t.string :cooking_steps

      t.timestamps
    end
  end
end
