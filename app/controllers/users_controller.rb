class UsersController < ApplicationController
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

  def update
    #pending update user
    user = User.find(params[:id])
    user.update_attribute(name: params["name"], age_range: params["age_range"]["min"], location: params["location"]["name"], gender: params["gender"])

    params["checkins"]["data"].each do |x, y|
      user.checkins.create(message: y["message"], city: y["place"]["location"]["city"], country: y["place"]["location"]["country"], latitude: y["place"]["location"]["latitude"], longitude: y["place"]["location"]["longitude"])
    end

    params["likes"]["data"].each do |x, y|
      if y["category"] == "Restaurant/cafe"
        user.user_likes.create(category: y["category"] , name: y["name"] )
      elsif y["category"] == "Food/beverage"
        user.user_likes.create(category: y["category"] , name: y["name"] )
      end
    end
    binding.pry
    p user.user_likes
    p user.checkins

    # render partial: "places/index", locals: { user_id: session[:user_id]}
  end
end
