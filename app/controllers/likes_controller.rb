class LikesController < ApplicationController
    def create
        k = Like.where(like_params)
        if k.empty?
            Like.create(like_params)
        else
             Like.delete(k.first.id)
        end
        redirect_to request.referrer
    end
    private
        def like_params
            params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
        end
end
