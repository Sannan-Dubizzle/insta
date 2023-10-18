class CommentsController < ApplicationController
    def create
      @comment = Comment.new(comment_params)
      # @comment.user = current_user
  
      if @comment.save
        respond_to do |format|
          format.html { redirect_to request.referrer }
          format.js
        end
      else
        render :new
      end
    end
        def show
            @comment = Comment.find(params[:id])
        end 
    private
  
    def comment_params
      params.require(:comment).permit(:body, :commentable_type, :commentable_id, :user_id)
    end
  end
  