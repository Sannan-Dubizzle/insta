class Comment < ApplicationRecord
  belongs_to :person
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
