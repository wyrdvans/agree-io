require 'test_helper'

class TermTest < ActiveSupport::TestCase

  def test_revise
    t = Term.create
    t.revise! "This is the first version"
    t.revise! "This is the second version"
    t.revise! "This is the third version"
    assert t.content == "This is the third version"
    assert t.revisions.count == 3
  end

end
