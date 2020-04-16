class CommentsController < ApplicationController
    def create 
        comment = Comment.create(comment_params)
        redirect_to house_path(comment.post.house)
    end

    private 

    def comment_params 
        params.require(:comment).permit(:user_id, :post_id, :content)
    end
end
