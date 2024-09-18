require "application_system_test_case"

class SubFormsTest < ApplicationSystemTestCase
  setup do
    @sub_form = sub_forms(:one)
  end

  test "visiting the index" do
    visit sub_forms_url
    assert_selector "h1", text: "Sub forms"
  end

  test "should create sub form" do
    visit sub_forms_url
    click_on "New sub form"

    click_on "Create Sub form"

    assert_text "Sub form was successfully created"
    click_on "Back"
  end

  test "should update Sub form" do
    visit sub_form_url(@sub_form)
    click_on "Edit this sub form", match: :first

    click_on "Update Sub form"

    assert_text "Sub form was successfully updated"
    click_on "Back"
  end

  test "should destroy Sub form" do
    visit sub_form_url(@sub_form)
    click_on "Destroy this sub form", match: :first

    assert_text "Sub form was successfully destroyed"
  end
end
