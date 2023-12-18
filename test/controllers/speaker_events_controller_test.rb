require "test_helper"

class SpeakerEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @speaker_event = speaker_events(:one)
  end

  test "should get index" do
    get speaker_events_url
    assert_response :success
  end

  test "should get new" do
    get new_speaker_event_url
    assert_response :success
  end

  test "should create speaker_event" do
    assert_difference("SpeakerEvent.count") do
      post speaker_events_url, params: { speaker_event: {  } }
    end

    assert_redirected_to speaker_event_url(SpeakerEvent.last)
  end

  test "should show speaker_event" do
    get speaker_event_url(@speaker_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_speaker_event_url(@speaker_event)
    assert_response :success
  end

  test "should update speaker_event" do
    patch speaker_event_url(@speaker_event), params: { speaker_event: {  } }
    assert_redirected_to speaker_event_url(@speaker_event)
  end

  test "should destroy speaker_event" do
    assert_difference("SpeakerEvent.count", -1) do
      delete speaker_event_url(@speaker_event)
    end

    assert_redirected_to speaker_events_url
  end
end
