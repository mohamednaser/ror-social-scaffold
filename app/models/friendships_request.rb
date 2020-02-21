class FriendshipsRequest < ApplicationRecord
    belongs_to :users

    belongs_to :friend, :class_name => "User"
end
