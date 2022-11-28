class Artist < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :genre, :description
  validates :description, length: { minimum: 25 }
end
