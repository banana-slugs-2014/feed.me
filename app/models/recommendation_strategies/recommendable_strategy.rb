class RecommendableStrategy < RecommendationStrategy

  def recommend(data)
    if data.user.recommended_places
      data.user.recommended_places.sample
    else
      data.places.sample
    end
  end

end