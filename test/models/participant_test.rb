require "test_helper"

class ParticipantTest < ActiveSupport::TestCase
  test "should not create if event capacity exceeded" do
    event = events(:full)
    user = users(:free)
    participant = Participant.new(event: event, user: user)
    assert_not participant.save
  end
end
