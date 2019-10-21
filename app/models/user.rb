class User < ApplicationRecord
    has_many :cuisine_preferences
    has_many :matches
    has_many :cuisines, through: :cuisine_preferences
    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: true
end
