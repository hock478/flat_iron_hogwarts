class Chat < ApplicationRecord
    belongs_to :message
    belongs_to :friend
    belongs_to :user
end
