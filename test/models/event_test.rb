require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "should capacity be greater equal to participants count" do
    event = events(:not_full)
    assert event.participants.count > 0
    event.capacity = 0
    assert_not event.save

    event.capacity = event.participants.count
    assert event.save
  end
end
