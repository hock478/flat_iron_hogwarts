class Post < ApplicationRecord
    belongs_to :user
    belongs_to :house
    has_many :comments
    def time_passed 
        
    end
end
