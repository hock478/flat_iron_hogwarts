class Message < ApplicationRecord
    has_many :chats
    has_many :friends, through: :chats
    has_many :users

    def self.chat(current,user)
        chat =  Message.where(sender_id: current.id, receiver_id: user.id) + Message.where(sender_id: user.id, receiver_id: current.id)
        chat
    end
end
# test.sort_by{|t| -t[:id]}.each {|x| puts x.created_at}