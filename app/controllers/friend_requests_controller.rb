class FriendRequestsController < ApplicationController
    def new
        @user = User.find(params[:user_id].to_i)
        FriendRequest.create(user1_id: current_user.id, user2_id: params[:user_id].to_i)
        redirect_to user_path(@user)
    end
    def accept
        request = FriendRequest.where('user1_id = ?', params[:user_id].to_i).first
        FriendRequest.delete(request.id)
        Friendship.create(user1_id: current_user.id, user2_id:params[:user_id].to_i )
    end
end
