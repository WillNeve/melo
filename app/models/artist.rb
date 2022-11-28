class Artist < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :genre, :description
  validates :description, length: { minimum: 25 }
  has_one_attached :avatar
  has_one_attached :banner
  has_many_attached :photos
end
