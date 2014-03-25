class SimpleQuirkyPlaces < RecommendationStrategy

  def recommend(data)
    off_the_beaten_path
  end

  private

  def off_the_beaten_path
    less_than_avg.sample
  end

  def likes_per_place
    @likes_per_place ||= Recommendation.group(:place).count(:like)
  end

  def avg_likes_per_place(likes_per_place)
    likes_per_place.values.inject(&:+) / likes_per_place.length.to_f
  end

  def less_than_avg
    avg = avg_likes_per_place(likes_per_place)
    less = []
    likes_per_place.each_pair do |place, likes|
      less << place if likes < avg
    end
    less.empty? ? [Place.first] : less
  end
end
