class SessionsController < ApplicationController


   # if user is found by token && userid
  # set session = userid

  #??

  # logout
  # button facebook - delete session key


  def create
    user = User.find_by_uid(params[:authResponse][:userID])
    unless user
      user= User.new
      user.uid = params[:authResponse][:userID]
      user.oauth_token = params[:authResponse][:accessToken]
      user.save
    end
    redirect_to root_path
  end

  def destroy
    redirect_to root_path
  end
end