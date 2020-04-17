class CookingStep < ApplicationRecord
    belongs_to :recipe

    validates :content, length: { maximum: 500 }
    # validates :recipe_id, presence: true
end
