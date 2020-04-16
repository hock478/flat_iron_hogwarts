class Post < ApplicationRecord
    belongs_to :user
    belongs_to :house
    has_many :comments
    has_many :likes
    
    def display_likes(user)
        selflike = Like.find_by(post: self, user: user)
        users = [] 
        self.likes.each {|like| users << like.user}
        num = users.length
        if users.length > 2
            if selflike
            user1 = user
            else 
            user1 = users.sample()
            users.remove(user1)
            user2 = users.sample()
            return "👍 You, #{user2.name} and #{num.length - 2} others liked this post" if selflike
            return "👍 #{user1.name}, #{user2.name} and #{num.length - 2} others liked this post"
            end
        elsif users.length == 2
            return "👍 You and #{users[0].name} liked this post" if selflike
            return "👍#{users[0].name} and #{users[1].name} liked this post" 
        elsif users.length == 1
            return "👍 You liked this post" if selflike
            return "👍 #{users[0].name} liked this post" 
        else
            return "Be the first to like this post"
        end
    end
end
