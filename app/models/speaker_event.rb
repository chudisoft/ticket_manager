# This Class handles operations related to Booking
class SpeakerEvent < ApplicationRecord
  belongs_to :speaker
  belongs_to :event

  validates :topic, presence: true, length: { minimum: 4, maximum: 150 }
  validates :details, presence: true, length: { minimum: 4, maximum: 1500 }
  validates :speak_from, presence: true, timeliness: { type: :datetime }
  validates :speak_to, presence: true, timeliness: { type: :datetime, after: :speak_from }

  # Other validations...
end
