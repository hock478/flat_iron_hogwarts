class Post < ApplicationRecord
    belongs_to :user
    belongs_to :house

    def time_passed 
        
    end
end
