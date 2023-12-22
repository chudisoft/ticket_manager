# This Class handles operations related to User Record
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :speakers, dependent: :destroy

  enum role: { guest: 0, member: 1, admin: 2 }
  enum status: {
    active: 0,
    inactive: 1,
    blocked: 2,
  }


  validates :fname, presence: true, length: { minimum: 3, maximum: 50 }
  # validates :phone, presence: false, length: { minimum: 11, maximum: 15 }
  validates :phone, allow_blank: true, length: { minimum: 11, maximum: 15 }
  validates :role, presence: true, length: { minimum: 4, maximum: 7 }
  validates :credit_card, length: { minimum: 15, maximum: 16 }, allow_blank: true
  validates :credit_card_expiry, length: { is: 5 }, allow_blank: true

  validate :fullname_format

  def fullname_format
    return if fname.blank? || fname.split.size >= 2

    errors.add(:fname, 'Name must contain at least two names separated by a space')
  end
end
