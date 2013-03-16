ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
end

def basic_term
  t = Term.new
  t.content = "Initial version"
  t.emails = "a@agree.io, b@agree.io"
  t.save
  t
end

def signed_term
  t = basic_term
  t.sign! t.participants.first.id, '127.0.0.1', '01:23:45:67:89:ab'
  t.save
  t
end
