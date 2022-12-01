class DmRoom < ApplicationRecord
  has_many :user_dms
  has_many :users, through: :user_dms
  has_many :messages

  scope :public_channels, -> { where(direct_message: false) }
  scope :direct_messages, -> { where(direct_message: true) }

  # def self.direct_message_for_users(users)
  #   user_ids = users.map(&:username).sort
  #   name = user_ids.join(" and ").to_s

  #   if dm_room == direct_messages.where(name: name).first
  #     return dm_room
  #   else
  #     dm_room = new(name: name, direct_message: true)
  #     dm_room.users = users
  #     dm_room.save
  #     dm_room
  #   end
  # end
end
