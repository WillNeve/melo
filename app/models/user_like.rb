class UserLike < ApplicationRecord
  belongs_to :artist
  belongs_to :user
  validates :user, uniqueness: { scope: :artist_id }
end
