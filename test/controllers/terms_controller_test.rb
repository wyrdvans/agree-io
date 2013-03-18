require 'test_helper'

class TermsControllerTest < ActionController::TestCase

  test "listing terms does not show things that aren't mine" do
    t = basic_term
    get :index
    assert_response :success
    refute assigns(:terms).include?(t)
  end

  test "viewing a term" do
    t = basic_term
    get :show, id: t.id
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
  end

  test "updating an unsigned term succeeds" do
    t = basic_term
    put :update, id: t.id, term: { content: "IS it too late?" }, format: 'json'
    assert_response :success
  end

  test "updating a signed term fails (and is forbidden)" do
    t = signed_term    
    put :update, id: t.id, term: { content: "IS it too late?" }, format: 'json'
    assert_response :forbidden
  end

end
