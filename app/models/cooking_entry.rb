class CookingEntry < ApplicationRecord
    belongs_to :chef
    belongs_to :recipe

    validates :date, presence: true 
    validates :review, presence: true, length: { maximum: 500 }
    validates :rating, presence: true
    validates :rating, numericality: { greater_than: 0 }
    validates :rating, numericality: { less_than: 6 }
end