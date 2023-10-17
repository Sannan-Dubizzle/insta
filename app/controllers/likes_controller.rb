class LikesController < ApplicationController
    def create
        alreadyLiked = Like.where(like_params)
        if alreadyLiked.empty?
            Like.create(like_params)
        else
             Like.delete(alreadyLiked.first.id)
        end
        redirect_to request.referrer
    end
    private
        def like_params
            params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
        end
end
