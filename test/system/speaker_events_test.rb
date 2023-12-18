require "application_system_test_case"

class SpeakerEventsTest < ApplicationSystemTestCase
  setup do
    @speaker_event = speaker_events(:one)
  end

  test "visiting the index" do
    visit speaker_events_url
    assert_selector "h1", text: "Speaker events"
  end

  test "should create speaker event" do
    visit speaker_events_url
    click_on "New speaker event"

    click_on "Create Speaker event"

    assert_text "Speaker event was successfully created"
    click_on "Back"
  end

  test "should update Speaker event" do
    visit speaker_event_url(@speaker_event)
    click_on "Edit this speaker event", match: :first

    click_on "Update Speaker event"

    assert_text "Speaker event was successfully updated"
    click_on "Back"
  end

  test "should destroy Speaker event" do
    visit speaker_event_url(@speaker_event)
    click_on "Destroy this speaker event", match: :first

    assert_text "Speaker event was successfully destroyed"
  end
end
