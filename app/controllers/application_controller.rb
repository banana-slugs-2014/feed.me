class ApplicationController < ActionController::Base
  protect_from_forgery

    def current_user
      @user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end
end
