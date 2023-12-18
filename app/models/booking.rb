# This Class handles operations related to Booking
class Booking < ApplicationRecord
  belongs_to :guest, class_name: 'User', foreign_key: 'guest_id'
  belongs_to :event

  validates :event, presence: true
  validates :qty, presence: true, numericality: { greater_than: 0 }
  validates :comments, presence: false

  validate :validate_available_slots

  private

  def validate_available_slots
    if event && qty.to_i > event.available_slot
      errors.add(:qty, "exceeds available slots for this event")
    end
  end
end
