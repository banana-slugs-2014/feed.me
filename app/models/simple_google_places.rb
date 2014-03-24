class SimpleGooglePlaces < RecommendationStrategy

  def recommend
    a_close_restaurant
  end

  private

  def a_close_restaurant
    Place.last(10).sample
  end

end