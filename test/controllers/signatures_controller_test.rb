require 'test_helper'

class SignaturesControllerTest < ActionController::TestCase

  def test_preparing_to_sign
    term = basic_term
    uuid = term.participants.first.id
    get :new, participant_id: uuid, term_id: term.id
    assert_response :success
  end

  def test_signing_a_term
    term = basic_term
    uuid = term.participants.first.id

    assert_difference 'Signature.count' do
      post :create, participant_id: uuid, term_id: term.id, format: 'json'
    end

    assert_response :created
  end

end
