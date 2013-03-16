class Participant < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { scope: 'term_id' }
  belongs_to :term
  has_one :signature
end
