class CookingEntry < ApplicationRecord
    belongs_to :chef
    belongs_to :recipe

    validates :date, presence: true 
    validates :review, presence: true, length: { maximum: 500 }

    Ratings = ["🖤🤍🤍🤍🤍", "🖤🖤🤍🤍🤍", "🖤🖤🖤🤍🤍", "🖤🖤🖤🖤🤍", "🖤🖤🖤🖤🖤"]
    validates :rating, inclusion: Ratings
end