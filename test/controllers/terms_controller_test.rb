require 'test_helper'

class TermsControllerTest < ActionController::TestCase

  test "creating a term creates a revision" do
    assert_difference 'Term.count' do
      post :create, { term: { content: "This is my first revision" } }
    end
  end

  test "creating a term with invalid parameters" do
    assert_no_difference 'Term.count' do
      post :create, { term: { content: "" } }
    end
  end

  test "viewing a term" do
    t = Term.new
    t.revisions << Revision.new(content: "Your first born child.")
    t.save

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

end
