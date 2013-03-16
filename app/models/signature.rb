class Signature < ActiveRecord::Base
  belongs_to :term
  belongs_to :participant
end
