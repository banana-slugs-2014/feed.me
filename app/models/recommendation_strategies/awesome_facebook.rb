class AwesomeFacebook < RecommendationStrategy

  def recommend(data)
    @user = data.user
    @places = data.places
    @hour = Time.now.hour

    recommendation = determine_place_based_on_user_and_time

    recommendation.nil? ? @places.sample : recommendation
  end

  private

  def determine_place_based_on_user_and_time
    meal = meal_types
    case
    when breakfast?
      find_place(meal[:breakfast])
    when lunch?
      find_place(meal[:lunch])
    when dinner? && user_not_single
      find_place(meal[:dinner])
    when dinner? && user_over_twentyone
      find_place(meal[:bar])
    end
  end

  def find_place(opts = [])
    possibilities = @places.select do |place|
      (opts & place.types).any?
    end
    possibilities.sample
  end

  def meal_types
    { lunch: ["Mexican Restaurant", "Burrito Place", "Taco Place", "BBQ Joint", "Food Truck", "Hot Dog Joint", "Burger Joint", "Pizza Place", "Ramen / Noodle House", "Sandwich Place"],
      bar: ["Irish Pub", "Gastropub", "Brewery", "Bar"],
      breakfast: ["Bagel Shop", "Bakery", "Cafe", "Diner", "Donut Shop", "Breakfast Spot"],
      dinner: ["Sushi Restaurant", "Steakhouse", "Tapas Restaurant", "Thai Restaurant", "Japanese Restaurant", "Indian Restaurant", "French Restaurant", "Asian Restaurant", "American Restaurant"] }
    end

  def breakfast?
    @hour < 12
  end

  def lunch?
    @hour >= 12 && @hour <= 18
  end

  def dinner?
    @hour >= 18 && @hour <= 24
  end

  def user_not_single
    @user.relationship_status != "Single"
  end

  def user_over_twentyone
    @user.age_range >= 21
  end
end