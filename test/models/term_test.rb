require 'test_helper'

class TermTest < ActiveSupport::TestCase

  def test_revise
    t = Term.new
    t.content = "Initial version"
    t.emails  = "a@agree.io, b@agree.io"
    t.save
    t.revise! "Something different"
    assert_equal "Something different", t.content
    assert_equal 2, t.revisions.count
  end

  def test_sign
    t = Term.new
    t.content = "Initial version"
    t.emails  = "a@agreeio, b@agree.io"
    t.save

    uuid = t.participants.first.id
    t.sign! uuid, '127.0.0.1', '01:23:45:67:89:ab'

    assert_equal 1, t.signatures.count
  end

  def test_signed_terms_cannot_be_revised
    t = signed_term
    t.revise! "This is a new version"
    refute_equal "This is a new version", t.content
  end

  def test_creating_participants_from_string_of_emails
    t = Term.new
    t.content  = "Something arbitrary for this test"
    t.emails   = "a@agree.io, b@agree.io, a@agree.io"
    t.save
    assert_equal 2, t.participants.length
  end

end
