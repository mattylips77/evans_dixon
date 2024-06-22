require "test_helper"

class ClientLegalFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_legal_form = client_legal_forms(:one)
  end

  test "should get index" do
    get client_legal_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_client_legal_form_url
    assert_response :success
  end

  test "should create client_legal_form" do
    assert_difference("ClientLegalForm.count") do
      post client_legal_forms_url, params: { client_legal_form: { client_id: @client_legal_form.client_id, first_login_date: @client_legal_form.first_login_date, legal_form_id: @client_legal_form.legal_form_id, most_recent_login: @client_legal_form.most_recent_login } }
    end

    assert_redirected_to client_legal_form_url(ClientLegalForm.last)
  end

  test "should show client_legal_form" do
    get client_legal_form_url(@client_legal_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_legal_form_url(@client_legal_form)
    assert_response :success
  end

  test "should update client_legal_form" do
    patch client_legal_form_url(@client_legal_form), params: { client_legal_form: { client_id: @client_legal_form.client_id, first_login_date: @client_legal_form.first_login_date, legal_form_id: @client_legal_form.legal_form_id, most_recent_login: @client_legal_form.most_recent_login } }
    assert_redirected_to client_legal_form_url(@client_legal_form)
  end

  test "should destroy client_legal_form" do
    assert_difference("ClientLegalForm.count", -1) do
      delete client_legal_form_url(@client_legal_form)
    end

    assert_redirected_to client_legal_forms_url
  end
end
