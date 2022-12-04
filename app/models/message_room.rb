class MessageRoom < ApplicationRecord
  has_many :users_rooms
  has_many :messages
  has_many :users, through: :users_rooms
end
