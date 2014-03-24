class RecommendableStrategy < RecommendationStrategy

  def recommend(data)
    data.user.recommended_places.sample
  end

end