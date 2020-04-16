class Friend < ApplicationRecord
    belongs_to :follow, :class_name => 'User', 
        :foreign_key => 'follow_id'
    belongs_to :follower, :class_name => 'User', 
        :foreign_key => 'follower_id'


        def customhelper
            !!Friend.find_by(follow: self.follower, follower: self.follow)
        end

        def self.customthing(user)
            my_friends_array = []
            user.followed.each {|x| my_friends_array << x.follower if x.customhelper}
            my_friends_array
        end

        def self.pending(current)
            my_friends_array = []
            current.followed.each {|x| my_friends_array << x.follower if !x.customhelper}
            my_friends_array
        end
end



