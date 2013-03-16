require 'test_helper'

class RevisionTest < ActiveSupport::TestCase

  def test_revisability_of_terms
    t = signed_term
    r2 = Revision.new(term: t, content: "Too late?")
    assert t.signed?, "Expected the term to be signed"
    assert r2.invalid?, "Signed terms cannot be revised"
  end

end
