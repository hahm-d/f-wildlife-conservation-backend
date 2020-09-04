class SearchSerializer < ActiveModel::Serializer
    attributes :term
    has_many :users
end