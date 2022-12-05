class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  validates_presence_of :start_date, :end_date
  validates_presence_of :location, :event_type
end
