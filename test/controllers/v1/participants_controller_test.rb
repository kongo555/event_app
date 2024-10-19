require "test_helper"

class V1::ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should list current user events" do
    token = devise_api_tokens(:user)

    get v1_participants_url, headers: { Authorization: "Bearer #{token.access_token}" }, as: :json
    assert_response :success
    assert_equal response.parsed_body.size, token.resource_owner.events.count
  end

  test "should create participant" do
    token = devise_api_tokens(:free)
    event = events(:not_full)

    assert_difference("Participant.count") do
      post v1_participants_url,
        headers: { Authorization: "Bearer #{token.access_token}" },
        params: { id: event.id },
        as: :json
    end

    assert_response :created
  end
end
