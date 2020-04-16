class LikesController < ApplicationController

    def create
        @like = Like.create(like_params)
        redirect_to house_path(@like.post.house)
    end

    def unlike
        # byebug
        like = Like.find_by(like_params)
        house = like.post.house
        like.destroy
        redirect_to house_path(house)
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end
end
