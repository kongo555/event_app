class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id }

  after_create do
    if event.participants.count > event.capacity
      errors.add(:base, "event capacity exceeded")
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end

  after_commit { ParticipantMailer.join_email(self).deliver }
end
