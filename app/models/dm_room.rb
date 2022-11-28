class DmRoom < ApplicationRecord
  has_many :user_dms
  has_many :users, through: :user_dms
  has_many :messages
end
