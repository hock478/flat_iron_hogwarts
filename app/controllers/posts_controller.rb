class PostsController < ApplicationController

    def create 
        post = Post.create(post_params)
        redirect_to house_path(post.house)
    end

    private 

    def post_params 
        params.require(:post).permit(:user_id, :house_id, :content)
    end
end
