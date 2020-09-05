class SearchSerializer
    include FastJsonapi::ObjectSerializer
    attributes :term
    has_many :users
end