require 'test_helper'

class TermsControllerTest < ActionController::TestCase

  setup do
    @unsigned, @signed = basic_term, signed_term
  end

  test "listing terms does not show things that aren't mine" do
    get :index
    assert_response :success
    refute assigns(:terms).include?(@unsigned)
  end

  test "viewing a term" do
    get :show, id: @unsigned.id
    assert_response :success
  end

  test "getting a term as json" do
    get :show, id: @unsigned.id, format: 'json'
    assert_response :success
  end

  test "writing new terms" do
    get :new
    assert_response :success
  end

  test "creating a term creates a revision" do
    assert_difference 'Term.count' do
      post :create, {
        term: {
          content: "This is my first revision",
          emails: "a@agree.io b@agree.io"
        }
      }
    end
  end

  test "creating a term with invalid parameters" do
    assert_no_difference 'Term.count' do
      post :create, { term: { content: "", emails: "" } }
    end
    assert_response 409
  end

  test "updating an unsigned term succeeds" do   
    put :update, id: @unsigned.id, term: { content: "IS it too late?" }, format: 'json'
    assert_response :success
  end

  test "updating a signed term fails (and is forbidden)" do
    put :update, id: @signed.id, term: { content: "IS it too late?" }, format: 'json'
    assert_response :forbidden
  end

end
