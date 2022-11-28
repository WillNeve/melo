class Message < ApplicationRecord
  belongs_to :dm_room
  belongs_to :user
  validates_presence_of :content
end
