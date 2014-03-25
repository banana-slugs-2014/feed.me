class WeirdFacebook < RecommendationStrategy

  def recommend(data)
    @user = data.user
    @places = data.places
    @hour = Time.now.hour
    recommendation = determine_place_based_on_user_and_time

    if recommendation.nil?
      recommendation = @places.sample
    end
    recommendation
  end

  private

  def determine_place_based_on_user_and_time
    category_groups = find_possible_groups
    if user_in_twenties && lunch
      recommendation = find_place(category_groups[:lunch_twenties])
    elsif breakfast
      recommendation = find_place(category_groups[:breakfast_places])
    elsif dinner && user_not_single
      recommendation = find_place(category_groups[:dinner_for_two])
    end
  end

  def find_possible_groups
    {lunch_twenties: ["Mexican Restaurant", "Burrito Place", "Taco Place", "BBQ Joint", "Food Truck", "Hot Dog Joint", "Burger Joint", "Irish Pub", "Gastropub", "Pizza Place", "Ramen / Noodle House", "Sandwich Place"],
      breakfast_places: ["Bagel Shop", "Bakery", "Cafe", "Diner", "Donut Shop", "Breakfast Spot"],
      dinner_for_two: ["Sushi Restaurant", "Steakhouse, Tapas Restaurant, Thai Restaurant, Japanese Restaurant, Indian Restaurant, French Restaurant, Asian Restaurant, American Restaurant"]}
  end

  def breakfast
    @hour < 12
  end

  def lunch
    @hour >= 12 && @hour <= 18
  end

  def dinner
    @hour >= 18 && @hour <= 24
  end

  def user_not_single
    @user.relationship_status != "Single"
  end

  def user_in_twenties
    @user.age_range >= 21 && @user.age_range <= 30
  end

  def find_place(opts = [])
    possibilities = @places.select do |place|
      types = place.types
      (opts & types) != []
    end
    possibilities.sample
  end
end