class FriendsController < ApplicationController

    def create
        @friend = Friend.create(friends_params)
        redirect_to user_path(@friend.follow)
    end

    def unfriend
        # byebug
        friend = Friend.find_by(friends_params)
        if Friend.find_by(follower_id: friend[:follow_id], follow_id: friend[:follower_id])
        reverse = Friend.find_by(follower_id: friend[:follow_id], follow_id: friend[:follower_id])
        reverse.destroy
        end
        user = friend.follow
        friend.destroy
        
        redirect_to user_path(user)
    end

    private
    def friends_params
        params.require(:friend).permit(:follower_id, :follow_id)
    end
end
