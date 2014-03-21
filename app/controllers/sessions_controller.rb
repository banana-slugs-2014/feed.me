class SessionsController < ApplicationController

  def create
    user = User.find_by_uid(params[:authResponse][:userID])
    unless user
      user= User.new
      user.uid = params[:authResponse][:userID]
      user.oauth_token = params[:authResponse][:accessToken]
      user.save
      login_user(user.uid)
      # api call more info <- json "api call"
    end
    login_user(user.uid)
    redirect_to root_path
  end

  def destroy
    redirect_to root_path
  end
end