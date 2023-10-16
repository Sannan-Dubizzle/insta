class FriendRequestsController < ApplicationController
    def new
        @user = User.find(params.permit(:user_id)[:user_id].to_i)
        FriendRequest.create(requester_id: current_user.id, user_id: params.permit(:user_id)[:user_id].to_i)
        redirect_to user_path(@user)
    end
    def accept
        requester = FriendRequest.where('requester_id = ? AND user_id = ?',params.permit(:user_id).to_i,current_user.id).first
        requester.isPending=false
        requester.save
        Friendship.create(user_id: current_user.id, friend_id:params.permit(:user_id)[:user_id].to_i)
        Friendship.create(user_id: params.permit(:user_id)[:user_id].to_i, friend_id: current_user.id)
        redirect_to request.referrer
    end
end
