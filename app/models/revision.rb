class Revision < ActiveRecord::Base

  belongs_to :term

  validates :content, presence: true
  validate  :revisable_term

  private

  def revisable_term
    if term.present? and term.signed?
      errors.add :base, "Signed terms may not be revised."
    end
  end

end
