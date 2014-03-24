class RecommendableStrategy < RecommendationStrategy

  def recommend(data)
    if data.user.recommended_places
      data.user.recommended_places.sample
    else
      Place.last(10).sample
    end
  end

end