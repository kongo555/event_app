require "test_helper"

class ParticipantTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper
  
  test "should not create if event capacity exceeded" do
    event = events(:full)
    user = users(:free)
    participant = Participant.new(event: event, user: user)
    assert_not participant.save
  end

  test "should send email after create" do
    event = events(:not_full)
    user = users(:free)
    participant = Participant.new(event: event, user: user)
    assert_emails 1 do
      participant.save
    end
  end
end
