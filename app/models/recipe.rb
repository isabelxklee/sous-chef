class Recipe < ApplicationRecord
    belongs_to :chef
    has_many :recipe_ingredients
    has_many :cooking_steps
    has_many :cooking_entries
    has_many :ingredients, through: :recipe_ingredients
    accepts_nested_attributes_for :ingredients, :cooking_steps

    Categories = ["Appetizer", "Entrée", "Dessert", "Side", "Snack", "Beverage"]
    validates :meal_category, inclusion: Categories, presence: true

end