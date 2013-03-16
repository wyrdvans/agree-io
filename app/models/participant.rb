class Participant < ActiveRecord::Base
  validates :email, presence: true
  has_one :signature
end
