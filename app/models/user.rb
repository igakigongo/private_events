class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  # associations
  has_many :events
end
