class UsersController < ApplicationController

  def index

  end

  def login
    user = User.find_by_uid(params[:authResponse][:userID])
    unless user
      user= User.new
      user.uid = params[:authResponse][:userID]
      user.oauth_token = params[:authResponse][:accessToken]
      p user.save
    end
    redirect_to root_path
  end

end
