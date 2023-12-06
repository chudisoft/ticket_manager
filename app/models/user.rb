# This Class handles operations related to User Record
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :bookings
  has_many :speakers

  validates :id, presence: true, length: { minimum: 16, maximum: 36 }
  validates :fname, presence: true, length: { minimum: 3, maximum: 50 }
  validates :phone, presence: true, length: { minimum: 11, maximum: 15 }
  validates :role, presence: true, length: { minimum: 4, maximum: 7 }
  validate :fullname

  def fullname
    return unless fname.present? && fname.split.size != 2

    errors.add(:fname, 'Name must contain two names separated by a space')
  end
end
