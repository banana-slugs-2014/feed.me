class FacebookWeighted < RecommendationStrategy

  def recommend(data)
    weighted_random(data)
  end

  private

  def weighted_random(data)
    weighted_initial = Hash[data.places.map{ |place| [place, 3] }]
    weighted_places = update_weights(data.user, weighted_initial)
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

  def update_weights(user, normalized_data)
    #better way of creating updated weights hash?
    #current route: map the data to destructively update weight
    # outputs an array of douples --> Hash[douples]
    #to recreate array
    update_weights = normalized_data.inject({}) do |updated, (place, weight)|
      if user.age_range == 21
        case place.types.first
        when 'Brewery' then weight += 2
        when 'Irish Pub' then weight += 2
        when 'Beer Garden' then weight += 2
        when 'Gastropub' then weight += 2
        when 'Pizza Place' then weight += 1
        when 'Burger Joint' then weight += 1
        when 'Taco Place' then weight += 1
        when 'Mexican Restaurant' then weight += 1
        when 'Grocery Store' then weight -= 2
        else weight
        end
      end
    
      (weight += 3) if user.user_likes.pluck(:name).include?(place.name)
      (weight += 3) if user.checkins.pluck(:name).include?(place.name)
        
      updated = updated.merge(place => weight)
    end
    update_weights
  end

end
