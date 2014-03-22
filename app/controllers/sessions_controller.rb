class SessionsController < ApplicationController

  def create
    user = User.find_by_uid(params[:authResponse][:userID])
    unless user
      user= User.new
      user.uid = params[:authResponse][:userID]
      user.oauth_token = params[:authResponse][:accessToken]
      user.save
      # api call more info <- json "api call"
    end
    session[:user_id] = user.uid
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end