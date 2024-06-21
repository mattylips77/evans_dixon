require "test_helper"

class LegalFormQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legal_form_question = legal_form_questions(:one)
  end

  test "should get index" do
    get legal_form_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_legal_form_question_url
    assert_response :success
  end

  test "should create legal_form_question" do
    assert_difference("LegalFormQuestion.count") do
      post legal_form_questions_url, params: { legal_form_question: { legal_form_id: @legal_form_question.legal_form_id, options: @legal_form_question.options, position: @legal_form_question.position, question: @legal_form_question.question } }
    end

    assert_redirected_to legal_form_question_url(LegalFormQuestion.last)
  end

  test "should show legal_form_question" do
    get legal_form_question_url(@legal_form_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_legal_form_question_url(@legal_form_question)
    assert_response :success
  end

  test "should update legal_form_question" do
    patch legal_form_question_url(@legal_form_question), params: { legal_form_question: { legal_form_id: @legal_form_question.legal_form_id, options: @legal_form_question.options, position: @legal_form_question.position, question: @legal_form_question.question } }
    assert_redirected_to legal_form_question_url(@legal_form_question)
  end

  test "should destroy legal_form_question" do
    assert_difference("LegalFormQuestion.count", -1) do
      delete legal_form_question_url(@legal_form_question)
    end

    assert_redirected_to legal_form_questions_url
  end
end
