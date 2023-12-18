# This Class handles operations related to Event
class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User', foreign_key: 'organizer_id'
  has_many :bookings
  has_many :speaker_events
  has_many :speakers, through: :speaker_events

  validates :title, presence: true, length: { minimum: 3, maximum: 150 }
  validates :datetime, presence: true
  validates :venue, presence: true, length: { minimum: 4, maximum: 150 }
  validates :details, presence: true, length: { minimum: 10, maximum: 2500 }
  validates :vip_price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000 }
  validates :regular_price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000 }
  validates :available_slot, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100000 }
end
