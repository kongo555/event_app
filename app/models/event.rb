class Event < ApplicationRecord
  validates :name, presence: true
  validates :capacity, presence: true
  validates :start_at, presence: true
end
