require "test_helper"

class LegalFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legal_form = legal_forms(:one)
  end

  test "should get index" do
    get legal_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_legal_form_url
    assert_response :success
  end

  test "should create legal_form" do
    assert_difference("LegalForm.count") do
      post legal_forms_url, params: { legal_form: { name: @legal_form.name } }
    end

    assert_redirected_to legal_form_url(LegalForm.last)
  end

  test "should show legal_form" do
    get legal_form_url(@legal_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_legal_form_url(@legal_form)
    assert_response :success
  end

  test "should update legal_form" do
    patch legal_form_url(@legal_form), params: { legal_form: { name: @legal_form.name } }
    assert_redirected_to legal_form_url(@legal_form)
  end

  test "should destroy legal_form" do
    assert_difference("LegalForm.count", -1) do
      delete legal_form_url(@legal_form)
    end

    assert_redirected_to legal_forms_url
  end
end
