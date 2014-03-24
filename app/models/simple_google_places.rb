class SimpleGooglePlaces < RecommendationStrategy
  # I like that you're going here, but you might want to consider using subdirs
  # to lay this out.  Put recommendation_strategy.rb at the top level but then
  # have recommendation_strategy/{google.rb, facebook.rb} etc.
  #

  def recommend(data)
    a_close_restaurant
  end

  private

  def a_close_restaurant
    Place.last(10).sample
  end

end
