# This Class handles operations related to Event
class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User', foreign_key: 'organizer_id'
  has_many :bookings

  # If speaker can have multiple events
  has_many :speaker_events
  has_many :speakers, through: :speaker_events
  ## has_and_belongs_to_many :bookings

  validates :title, presence: true, length: { minimum: 3, maximum: 150 }
  validates :datetime, presence: true
  validates :venue, presence: true, length: { minimum: 4, maximum: 150 }
  validates :details, presence: true, length: { minimum: 10, maximum: 2500 }
  validates :vip_price, presence: true, range: { minimum: 0, maximum: 10000 }
  validates :regular_price, presence: true, range: { minimum: 0, maximum: 10000 }
  validates :available_slot, presence: true, range: { minimum: 1, maximum: 100000 }
end
