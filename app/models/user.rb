class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments
  has_many :posts
  has_many :friendships
  has_many :friend_requests
  has_many :friends, through: :friendships
  has_many :requesters, through: :friend_requests
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
