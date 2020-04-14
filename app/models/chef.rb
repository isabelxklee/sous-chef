class Chef < ApplicationRecord
    has_many :recipes
    has_many :cooking_entries

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email_address, presence: true, uniqueness: true
    validates :email_address, confirmation: { case_sensitive: false }
end