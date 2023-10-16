class FriendRequest < ApplicationRecord
    belongs_to :user
    belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'
  end