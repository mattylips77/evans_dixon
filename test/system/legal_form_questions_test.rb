require "application_system_test_case"

class LegalFormQuestionsTest < ApplicationSystemTestCase
  setup do
    @legal_form_question = legal_form_questions(:one)
  end

  test "visiting the index" do
    visit legal_form_questions_url
    assert_selector "h1", text: "Legal form questions"
  end

  test "should create legal form question" do
    visit legal_form_questions_url
    click_on "New legal form question"

    fill_in "Legal form", with: @legal_form_question.legal_form_id
    fill_in "Options", with: @legal_form_question.options
    fill_in "Position", with: @legal_form_question.position
    fill_in "Question", with: @legal_form_question.question
    click_on "Create Legal form question"

    assert_text "Legal form question was successfully created"
    click_on "Back"
  end

  test "should update Legal form question" do
    visit legal_form_question_url(@legal_form_question)
    click_on "Edit this legal form question", match: :first

    fill_in "Legal form", with: @legal_form_question.legal_form_id
    fill_in "Options", with: @legal_form_question.options
    fill_in "Position", with: @legal_form_question.position
    fill_in "Question", with: @legal_form_question.question
    click_on "Update Legal form question"

    assert_text "Legal form question was successfully updated"
    click_on "Back"
  end

  test "should destroy Legal form question" do
    visit legal_form_question_url(@legal_form_question)
    click_on "Destroy this legal form question", match: :first

    assert_text "Legal form question was successfully destroyed"
  end
end
