class SessionsController < ApplicationController

  def create
    user = User.find_by_uid(params[:authResponse][:userID])
    if user.blank?
      user = User.new
      user.uid = params[:authResponse][:userID]
      user.oauth_token = params[:authResponse][:accessToken]
      #consider removing if else protection on production
      if user.save
        session[:user_id] = user.uid
        render json: {id: user.id}
      else
        redirect_to root_path
      end
    else
      session[:user_id] = user.uid
      render partial: "places/index", locals: { user_id: session[:user_id]}
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end