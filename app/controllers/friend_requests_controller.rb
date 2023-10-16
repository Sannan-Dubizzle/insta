class FriendRequestsController < ApplicationController
    def new
        @user = User.find(params[:user_id].to_i)
        FriendRequest.create(user1_id: current_user.id, user2_id: params[:user_id].to_i)
        redirect_to user_path(@user)
    end
    def accept
        requester = FriendRequest.where('user1_id = ? AND user2_id = ?', params[:user_id].to_i,current_user.id).first
        FriendRequest.delete(requester.id)
        Friendship.create(user_id: current_user.id, friend_id:params[:user_id].to_i )
        Friendship.create(user_id: params[:user_id].to_i, friend_id: current_user.id)
        redirect_to request.referrer
    end
end
