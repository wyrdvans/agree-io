class Revision < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :term
end
