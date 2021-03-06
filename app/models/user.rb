class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  # associations
  has_many :events
  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, source: :event
end
