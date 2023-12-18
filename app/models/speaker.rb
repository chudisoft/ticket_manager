# This Class handles operations related to Event
class Speaker < ApplicationRecord
  belongs_to :user
  has_many :speaker_events
  has_many :events, through: :speaker_events
  has_one_attached :image

  ## has_and_belongs_to_many :bookings

  validates :title, presence: true, length: { minimum: 4, maximum: 150 }
  validates :name, presence: true, length: { minimum: 4, maximum: 150 }
  validates :bio, presence: false, length: { maximum: 1500 }

  def pic
    image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true) : nil
  end
end
