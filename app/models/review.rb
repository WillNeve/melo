class Review < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :comment, presence: true, length: { minimum: 8 }
end
