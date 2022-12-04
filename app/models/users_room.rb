class UsersRoom < ApplicationRecord
  belongs_to :message_room
  belongs_to :user
end
