class User < ApplicationRecord
    has_many :animals, through: :favorites
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
