require "test_helper"

class V1::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:not_full)
  end

  test "should get index" do
    get v1_events_url, as: :json
    assert_response :success
    assert_equal response.parsed_body.size, Event.count
  end

  test "should check authorization" do
    token = devise_api_tokens(:user)
    headers = { Authorization: "Bearer #{token.access_token}" }

    post v1_events_url(@event), headers: headers, as: :json
    assert_response :unauthorized

    get v1_event_url(@event), headers: headers, as: :json
    assert_response :unauthorized

    patch v1_event_url(@event), headers: headers, as: :json
    assert_response :unauthorized

    delete v1_event_url(@event), headers: headers, as: :json
    assert_response :unauthorized
  end

  test "should show event" do
    token = devise_api_tokens(:admin)
    get v1_event_url(@event),
      headers: { Authorization: "Bearer #{token.access_token}" },
      as: :json
    assert_response :success
    assert_equal response.parsed_body[:name], @event.name
  end

  test "should create event" do
    token = devise_api_tokens(:admin)

    assert_difference("Event.count") do
      post v1_events_url, 
        headers: { Authorization: "Bearer #{token.access_token}" },
        params: { event: { capacity: @event.capacity, name: @event.name, start_at: @event.start_at } },
        as: :json
    end

    assert_response :created
    assert_equal response.parsed_body[:capacity], @event.capacity
    assert_equal response.parsed_body[:name], @event.name
    assert_equal response.parsed_body[:start_at].to_datetime, @event.start_at
  end

  test "should update event" do
    capacity = 66
    name = "New Event"
    start_at = 5.days.from_now.beginning_of_hour
    token = devise_api_tokens(:admin)
    patch v1_event_url(@event),
      headers: { Authorization: "Bearer #{token.access_token}" },
      params: { event: { capacity: capacity, name: name, start_at: start_at } },
      as: :json

    assert_response :success
    assert_equal response.parsed_body[:capacity], capacity
    assert_equal response.parsed_body[:name], name
    assert_equal response.parsed_body[:start_at].to_datetime, start_at
  end

  test "should destroy event" do
    token = devise_api_tokens(:admin)
    assert_difference("Event.count", -1) do
      delete v1_event_url(@event),
        headers: { Authorization: "Bearer #{token.access_token}" },
        as: :json
    end

    assert_response :no_content
  end
end
