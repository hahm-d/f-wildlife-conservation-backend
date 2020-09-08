class User < ApplicationRecord
    has_many :favorites, dependent: :destroy
    has_many :animals, through: :favorites
    has_many :searches
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
