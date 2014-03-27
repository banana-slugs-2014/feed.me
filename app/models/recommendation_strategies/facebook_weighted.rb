class FacebookWeighted < RecommendationStrategy

  def recommend(data)
    weighted_random(data)
  end

  private

  def weighted_random(data)
    weighted_initial = Hash[data.places.map{ |place| [place, 3] }]
    weighted_places = update_weights!(data.user, weighted_initial)
    select_weighted_place(weighted_places)
  end

  def select_weighted_place(weighted_collection)
    weight_sum = weighted_collection.values.inject(:+)
    rand = Random.new.rand(weight_sum)

    selected_place = weighted_collection.detect do |place,weight|
      rand -= weight
      rand <= 0
    end
    selected_place.first
  end

  def update_weights!(user, normalized_data)
    update_weights = normalized_data.inject({}) do |memo, (place, weight)|
      
      weight += age_21_weights!(place.types) if user.age_range == 21
      (weight += 3) if user.user_likes.pluck(:name).include?(place.name)
      (weight += 3) if user.checkins.pluck(:name).include?(place.name)
        
      memo = memo.merge(place => weight)
    end
    update_weights
  end

  def age_21_weights!(types)
    weight = 0
    weight += (['Brewery','Irish Pub','Beer Garden','Gastropub'] & types).length * 2    
    weight += (['Pizza Place','Burger Joint','Taco Place','Mexican Restaurant'] & types).length    
    weight -= (['Grocery Store'] & types).length
    weight < 0 ? 0 : weight    
  end

end
