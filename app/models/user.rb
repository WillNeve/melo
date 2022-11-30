class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true
  validates :encrypted_password, length: { minimum: 6 }

  validates_presence_of :first_name, :last_name
  validates :phone_number, length: { minimum: 8 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :artist
  has_many :reviews
  has_many :bookings
  has_many :user_dms
  has_many :dm_rooms, through: :user_dms
  has_many :messages
  has_one_attached :avatar
end
