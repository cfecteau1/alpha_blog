ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  def sign_in_as(user, password)
    post login_path, session: {email: user.email, password: password}
  end
end
