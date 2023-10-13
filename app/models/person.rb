class Person < ApplicationRecord
    has_many :comments
    has_many :posts
    has_many :friendships
end
