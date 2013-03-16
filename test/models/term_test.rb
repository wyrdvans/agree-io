require 'test_helper'

class TermTest < ActiveSupport::TestCase

  def test_revise
    t = Term.create
    t.revise! "This is the first version"
    t.revise! "This is the second version"
    t.revise! "This is the third version"
    assert_equal "This is the third version", t.content
    assert t.revisions.count == 3
  end

  def test_signed_terms_cannot_be_revised
    t = signed_term    
    t.revise! "This is a new version"
    refute_equal "This is a new version", t.content
  end

end
