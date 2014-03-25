class WeirdFacebook < RecommendationStrategy

  def recommend(data)
    p "*" * 100
    @user = data.user
    @places = data.places

    if @user.age_range >= 21 && @user.age_range <= 30
      recommendation = find_place(["Mexican Restaurant", "Burrito Place", "Taco Place"])
    end
    recommendation
  end

  def find_place(opts = [])
    possibilities = @places.select do |place|
      types = place.types
      (opts & types) != []
    end
    possibilities.sample
  end
end