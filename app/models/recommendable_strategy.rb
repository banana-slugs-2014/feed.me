class RecommendableStrategy < RecommendationStrategy

  def recommend(data)
    debugger
    data.user.recommended_places.sample
  end

end