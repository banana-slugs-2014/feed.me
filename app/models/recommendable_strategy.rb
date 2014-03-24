class RecommendableStrategy < RecommendationStrategy

  def recommend
    current_user.recommended_places.sample
  end

end