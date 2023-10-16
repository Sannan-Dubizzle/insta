class CommentsController < ApplicationController
    def create
      @commentable = find_commentable
      @comment = @commentable.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        respond_to do |format|
          format.html { redirect_to @commentable }
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
      params.require(:comment).permit(:body)
    end
  
    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
  end
  