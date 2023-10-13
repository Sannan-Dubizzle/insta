class PostsController < ApplicationController
    def index
      friends = []

      Friendship.where('user1_id = ? OR user2_id = ?', current_user.id, current_user.id).each do |friend|
        if friend.user1_id == @person.id
          friends << User.find(friend.user2_id).id
        else
          friends << User.find(friend.user1_id).id
        end
      end
  
      @friends = friends.uniq 
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
