class Animal < ApplicationRecord
    has_many :users, through: :favorites
    serialize :locations, Array
end
