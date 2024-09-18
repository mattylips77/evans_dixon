require "test_helper"

class SubFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_form = sub_forms(:one)
  end

  test "should get index" do
    get sub_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_form_url
    assert_response :success
  end

  test "should create sub_form" do
    assert_difference("SubForm.count") do
      post sub_forms_url, params: { sub_form: {  } }
    end

    assert_redirected_to sub_form_url(SubForm.last)
  end

  test "should show sub_form" do
    get sub_form_url(@sub_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_form_url(@sub_form)
    assert_response :success
  end

  test "should update sub_form" do
    patch sub_form_url(@sub_form), params: { sub_form: {  } }
    assert_redirected_to sub_form_url(@sub_form)
  end

  test "should destroy sub_form" do
    assert_difference("SubForm.count", -1) do
      delete sub_form_url(@sub_form)
    end

    assert_redirected_to sub_forms_url
  end
end
