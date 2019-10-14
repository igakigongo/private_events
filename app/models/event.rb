class Event < ApplicationRecord
  # associations
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :event_attendances
end