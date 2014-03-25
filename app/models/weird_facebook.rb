class WeirdFacebook < RecommendationStrategy

  def recommend(data)
    p "*" * 100
    @user = data.user
    @places = data.places
    @hour = Time.now.hour
    if @user.age_range >= 21 && @user.age_range <= 30 && @hour >= 12 && @hour <= 18
      recommendation = find_place(["Mexican Restaurant", "Burrito Place", "Taco Place", "BBQ Joint", "Food Truck", "Hot Dog Joint", "Burger Joint", "Irish Pub", "Gastropub", "Pizza Place", "Ramen / Noodle House", "Sandwich Place"])
    elsif @hour < 12
      recommendation = find_place(["Bagel Shop", "Bakery", "Cafe", "Diner", "Donut Shop", "Breakfast Spot"])
    elsif @hour >= 18 && @hour <= 24 && @user.relationship_status != "Single"
      recommendation = find_place(["Sushi Restaurant", "Steakhouse, Tapas Restaurant, Thai Restaurant, Japanese Restaurant, Indian Restaurant, French Restaurant, Asian Restaurant, American Restaurant"])
    end

    if recommendation.nil?
      recommendation = @places.sample
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