class UserSerializer < ActiveModel::Serializer
  attributes :username, :avatar, :bio, :id
  has_many :favorites
  has_many :animals, through: :favorites
  has_many :searches
end
