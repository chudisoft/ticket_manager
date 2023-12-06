# This Class handles operations related to Event
class Speaker < ApplicationRecord
  belongs_to :user
  has_many :speaker_events
  has_many :events, through: :speaker_events

  ## has_and_belongs_to_many :bookings

  validates :title, presence: true, length: { minimum: 4, maximum: 150 }
  validates :name, presence: true, length: { minimum: 4, maximum: 150 }
  validates :pics, presence: true, length: { minimum: 4, maximum: 255 }
end
