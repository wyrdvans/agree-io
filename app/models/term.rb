class Term < ActiveRecord::Base

  primary_key = 'id'

  has_many :revisions
  has_many :participants
  has_many :signatures, through: 'participants'

  validates_associated :revisions

  def content
    self.revisions.last.content
  end

  def editable?
    self.signatures.present?
  end

end
