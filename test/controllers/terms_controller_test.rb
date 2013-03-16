require 'test_helper'

class TermsControllerTest < ActionController::TestCase

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

  test "viewing a term" do
    t = basic_term

    get :show, id: t.id
    assert_response :success
  end

  test "listing terms" do
    # I think this will eventually show you things
    # you participated in once you authenticate
    # your email address.
    get :index
    assert_response :success
  end

  test "writing new terms" do
    get :new
    assert_response :success
  end

  test "updating an unsigned term" do
    t = basic_term
    put :update, id: t.id, term: { content: "IS it too late?" }
    assert_response :success
  end

  test "updating a signed term" do
    t = signed_term    
    put :update, id: t.id, term: { content: "IS it too late?" }
    assert_response :conflict
  end

end
