require 'test_helper'

class SignaturesControllerTest < ActionController::TestCase

  def setup
    @term = basic_term
    @uuid = @term.participants.first.id
  end

  def test_preparing_to_sign
    get :new, participant_id: @uuid, term_id: @term.id
    assert_response :success
  end

  def test_signing_a_term
    assert_difference 'Signature.count' do
      post :create, participant_id: @uuid, term_id: @term.id, format: 'json'
    end

    assert_response :created
  end

  def test_missing_term_id_404s
    get :new, participant_id: @uuid
    assert_response :forbidden
  end

  def test_missing_participant_id_404s
    get :new, term_id: @term.id
    assert_response :forbidden
  end

  def test_signing_more_than_once
    t = signed_term    
    get :new, term_id: t.id, participant_id: t.participants.first.id
    assert_response :redirect
  end

end
