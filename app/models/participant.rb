class Participant < ActiveRecord::Base
  validates :email, presence: true
  belongs_to :term
  has_one :signature
end
