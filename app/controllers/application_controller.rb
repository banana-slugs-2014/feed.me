
#^^^^^^^^^^^^^^^^^^^ what is the sound of one empty line being added:  GONG
class ApplicationController < ActionController::Base
  protect_from_forgery

    def current_user
      @user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
      #                                                ^^^^^^^^^^
      # why is this necessary?  you're going to get nil either way?
    end

    def logged_in?
      !!current_user
    end
end
