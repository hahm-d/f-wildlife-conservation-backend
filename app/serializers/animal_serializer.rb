class AnimalSerializer < ActiveModel::Serializer
    attributes :name, :scientific_name, :facts, :img_url, :status, :population, :locations
    has_many :favorites
    has_many :users, through: :favorites
end