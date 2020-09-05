class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :avatar, :bio
  has_many :favorites
  has_many :animals, through: :favorites
  has_many :searches
end
