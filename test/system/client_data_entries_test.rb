require "application_system_test_case"

class ClientDataEntriesTest < ApplicationSystemTestCase
  setup do
    @client_data_entry = client_data_entries(:one)
  end

  test "visiting the index" do
    visit client_data_entries_url
    assert_selector "h1", text: "Client data entries"
  end

  test "should create client data entry" do
    visit client_data_entries_url
    click_on "New client data entry"

    click_on "Create Client data entry"

    assert_text "Client data entry was successfully created"
    click_on "Back"
  end

  test "should update Client data entry" do
    visit client_data_entry_url(@client_data_entry)
    click_on "Edit this client data entry", match: :first

    click_on "Update Client data entry"

    assert_text "Client data entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Client data entry" do
    visit client_data_entry_url(@client_data_entry)
    click_on "Destroy this client data entry", match: :first

    assert_text "Client data entry was successfully destroyed"
  end
end
