class CommentsController < ApplicationController
    def create
        puts('___________________________\n'+params[:comment][:commentable_type]+'\n______________________________')
        if params[:comment][:commentable_type]=='Post'
            @commentable = Post.find(params[:post_id])
        else
            @commentable = Comment.find(params[:comment][:commentable_id])
        end
        puts(comment_params)
        @comment = @commentable.comments.create(comment_params)
        redirect_to post_path(@commentable)
    end
    def show
        @comment = Comment.find(params[:id])
    end 
    private
        def comment_params
            params.require(:comment).permit(:person_id, :body)
            p=Person.find(params[:comment][:person_id])
           return {
            'body' => params[:comment][:body],
            'person' => p
           }
        end
end