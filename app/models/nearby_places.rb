class NearbyPlaces < RecommendationStrategy
  def recommend(data)
    p "@" * 100
    p User.find(1)
    # how to access current_user?
  end

  private

  def nearby
    # find dif. between user position latlng and batches of places latlng
    # return closest or return first that it finds that is less than 100 meters away
    # Place.where( all that stuff below equals the least distance:
      # test distances: cheesecake to super, formula: 13.35mi, google: 0.2mi
      #nopa to el farolito, formula: 117.40mi, google: 2.5mi
      # soooo ... not great.
    dlon = user.recent_longitude - place.longitude
    dlat = user.recent_latitude - place.latitude
    a = (Math.sin(dlat/2.0))**2 + Math.cos(place.latitude) * Math.cos(user.recent_latitude) * (Math.sin(dlon/2.0))**2
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a) )
    d = 3963.1676 * c


  end
end