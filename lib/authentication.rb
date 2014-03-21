module Authentication

  def login_user user
    session[:user_id] = user
  end

  def current_user
    @user ||= User.find_by_uid(uid: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

end