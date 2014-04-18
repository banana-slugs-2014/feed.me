class RecommendableStrategy < RecommendationStrategy

  def recommend(data)
    unless data.user.recommended_places.blank?
      data.user.recommended_places.sample
    else
      data.places.sample
    end
  end

end