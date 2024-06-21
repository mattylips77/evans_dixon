require "application_system_test_case"

class LegalFormsTest < ApplicationSystemTestCase
  setup do
    @legal_form = legal_forms(:one)
  end

  test "visiting the index" do
    visit legal_forms_url
    assert_selector "h1", text: "Legal forms"
  end

  test "should create legal form" do
    visit legal_forms_url
    click_on "New legal form"

    fill_in "Name", with: @legal_form.name
    click_on "Create Legal form"

    assert_text "Legal form was successfully created"
    click_on "Back"
  end

  test "should update Legal form" do
    visit legal_form_url(@legal_form)
    click_on "Edit this legal form", match: :first

    fill_in "Name", with: @legal_form.name
    click_on "Update Legal form"

    assert_text "Legal form was successfully updated"
    click_on "Back"
  end

  test "should destroy Legal form" do
    visit legal_form_url(@legal_form)
    click_on "Destroy this legal form", match: :first

    assert_text "Legal form was successfully destroyed"
  end
end
