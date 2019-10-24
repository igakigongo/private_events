class Event < ApplicationRecord
  # associations
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :event_attendances

  validates :date, presence: true
  validates :title, presence: true, allow_blank: false
  # scopes
  scope :is_past, -> { where('date < ?', Time.now) }
  scope :is_not_past, -> { where('date >= ?', Time.now) }
end
