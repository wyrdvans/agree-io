class Term < ActiveRecord::Base

  primary_key = 'id'

  has_many :revisions
  has_many :participants
  has_many :signatures, through: :participants

  validates_associated :revisions

  def content
    self.revisions.last.content
  end

  def revisable?
    self.signatures.empty?
  end

  def revise! content
    if revisable?
      self.revisions << Revision.new(content: content)
    end
  end

end
