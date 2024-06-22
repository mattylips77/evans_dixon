require "application_system_test_case"

class ClientLegalFormsTest < ApplicationSystemTestCase
  setup do
    @client_legal_form = client_legal_forms(:one)
  end

  test "visiting the index" do
    visit client_legal_forms_url
    assert_selector "h1", text: "Client legal forms"
  end

  test "should create client legal form" do
    visit client_legal_forms_url
    click_on "New client legal form"

    fill_in "Client", with: @client_legal_form.client_id
    fill_in "First login date", with: @client_legal_form.first_login_date
    fill_in "Legal form", with: @client_legal_form.legal_form_id
    fill_in "Most recent login", with: @client_legal_form.most_recent_login
    click_on "Create Client legal form"

    assert_text "Client legal form was successfully created"
    click_on "Back"
  end

  test "should update Client legal form" do
    visit client_legal_form_url(@client_legal_form)
    click_on "Edit this client legal form", match: :first

    fill_in "Client", with: @client_legal_form.client_id
    fill_in "First login date", with: @client_legal_form.first_login_date
    fill_in "Legal form", with: @client_legal_form.legal_form_id
    fill_in "Most recent login", with: @client_legal_form.most_recent_login
    click_on "Update Client legal form"

    assert_text "Client legal form was successfully updated"
    click_on "Back"
  end

  test "should destroy Client legal form" do
    visit client_legal_form_url(@client_legal_form)
    click_on "Destroy this client legal form", match: :first

    assert_text "Client legal form was successfully destroyed"
  end
end
