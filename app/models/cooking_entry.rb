class CookingEntry < ApplicationRecord
    belongs_to :chef
    belongs_to :recipe

    validates :date, presence: true 
    validates :review, presence: true, length: { maximum: 500 }

    # Ratings = ["🖤🤍🤍🤍🤍", "🖤🖤🤍🤍🤍", "🖤🖤🖤🤍🤍", "🖤🖤🖤🖤🤍", "🖤🖤🖤🖤🖤"]
    Ratings = ["1 / 5", "2 / 5", "3 / 5", "4 / 5", "5 / 5"]
    # validates :rating, inclusion: Ratings
end