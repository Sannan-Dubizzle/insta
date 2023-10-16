class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @person = User.find(params[:id].to_i)
    @posts = @person.posts
    # friends = []

    # Friendship.where('user1_id = ? OR user2_id = ?', @person.id, @person.id).each do |friend|
    #   if friend.user1_id == @person.id
    #     friends << User.find(friend.user2_id)
    #   else
    #     friends << User.find(friend.user1_id)
    #   end
    # end

    @friends = @person.friends
    @requests =FriendRequest.where('user2_id = ?', @person.id)

  end
end
