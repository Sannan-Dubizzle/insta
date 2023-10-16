class PostsController < ApplicationController
    def index
      @friends = current_user.friends.pluck(:id)
      @posts = Post.where("user_id = ? OR user_id IN (?)", current_user.id, @friends).order(updated_at: :DESC )
    end
    def show
        @post = Post.find(params[:id])
    end
    def new
        @post = Post.new
    end
    def create
        @post = Post.new(posts_params)
    
        if @post.save
          redirect_to @post
        else
          render :new, status: :unprocessable_entity
        end
    end
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
    
        if @post.update(posts_params)
          redirect_to @post
        else
          render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    
        redirect_to root_path, status: :see_other
    end
    private
    def posts_params
        params.require(:post).permit(:user_id, :body)
    end
end
