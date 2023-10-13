class LikesController < ApplicationController
    def create
        if params[:like][:likeable_type]=='Post'
            @likeable = Post.find(params[:post_id])
        else
            @likeable = Comment.find(params[:like][:likeable_id])
        end
        k = @likeable.likes.where('user_id = ?', params[:like][:user_id])
        if k.empty?
            @like = @likeable.likes.create(like_params)
        else
             Like.delete(k.first.id)
        end
        redirect_to post_path(@likeable)
    end
    private
        def like_params
            params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
            p=User.find(params[:like][:user_id])
           return {
            'user' => p
           }
        end
end
