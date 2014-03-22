
class ApplicationController < ActionController::Base
  protect_from_forgery
  include Authentication
  helper_method :current_user, :login_user, :logged_in?
end
