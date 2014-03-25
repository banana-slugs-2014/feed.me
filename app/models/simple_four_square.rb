class SimpleFourSquare < RecommendationStrategy

  def recommend(data)
    data.places.sample
  end
end