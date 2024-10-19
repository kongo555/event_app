class Event < ApplicationRecord
  validates :name, presence: true
  validates :capacity, presence: true
  validates :start_at, presence: true

  has_many :participants, dependent: :delete_all
  has_many :users, through: :participants

  after_save do
    if participants.count > capacity 
      errors.add(:capacity, "cannot be lower than participants count")
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end
end
