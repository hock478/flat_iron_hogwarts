class ChatsController < ApplicationController
    belongs_to :friend
    belongs_to :message
end
