class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :encrypted_password,
            length: { minimum: 8 }, format: { with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\z/,
                                              message: "Password must contain atleast 1 letter and 1 number" }

  validates_presence_of :first_name, :last_name
  validates :phone_number, length: { minimum: 8 }, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :artist
  has_many :messages
  has_many :reviews
  has_many :bookings
  has_many :user_dms
  has_many :dm_rooms, through: :user_dms
end
