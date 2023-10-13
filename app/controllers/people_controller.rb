class PeopleController < ApplicationController
  def index
  end

  def show
    @person = User.find(1)
    @posts = @person.posts
    friends = []

    Friendship.where('user1_id = ? OR user2_id = ?', @person.id, @person.id).each do |friend|
      if friend.user1_id == @person.id
        friends << User.find(friend.user2_id)
      else
        friends << User.find(friend.user1_id)
      end
    end

    @friends = friends.uniq  # Remove duplicates if any

  end
end
