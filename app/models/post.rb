class Post < ApplicationRecord
    belongs_to :person
    has_many :comments, as: :commentable
end
