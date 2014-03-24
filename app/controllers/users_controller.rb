class UsersController < ApplicationController
  def update
    #pending update user
    user = User.find(params[:id])
    user.update_attribute(:name, params[:name])
    render partial: "places/index", locals: { user_id: session[:user_id]}
  end
end
