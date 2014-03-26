class UsersController < ApplicationController
  def create #user/session create hybrid due to facebook login
    user = User.find_by_uid(params[:authResponse][:userID])
    if user.blank?
      user = User.new
      user.uid = params[:authResponse][:userID]
      user.oauth_token = params[:authResponse][:accessToken]
      user.save
      session[:user_id] = user.uid
      render json: {id: user.id}
    else
      session[:user_id] = user.uid
      render partial: "places/index", locals: { user_id: session[:user_id]}
    end
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(name: params[:name], gender: params[:gender])
    user.age_range = params[:age_range][:min] if params[:age_range]
    user.location = params[:location][:name] if params[:location]
    user.relationship_status = params[:relationship_status] if params[:relationship_status]
    user.save

    if params[:checkins]
      params[:checkins][:data].each_value do |value|
        if value[:place][:location][:country] == "United States"
          user.checkins.create(name: value[:place][:name], city: value[:place][:location][:city], country: value[:place][:location][:country], latitude: value[:place][:location][:latitude], longitude: value[:place][:location][:longitude])
        end
      end
    end

    if params[:likes]
      params[:likes][:data].each_value do |value|
        if ["Restaurant/cafe", "Food/beverages", "Company"].include?(value[:category])
          user.user_likes.create(category: value[:category], name: value[:name] )
        end
      end
    end

    render partial: "places/index", locals: { user_id: session[:user_id]}
  end
end
