class SimpleGooglePlaces < Strategy

  def recommend(data)
    a_close_restaurant
  end

  private

  def a_close_restaurant
    Place.last(10).take
  end

end