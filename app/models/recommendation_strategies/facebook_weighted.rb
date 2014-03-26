class FacebookWeighted < RecommendationStrategy

  def recommend(data)
    weighted_random(data)
  end

  private

  def weighted_random(data)
    weighted_initial = Hash[data.places.map{ |place| [place, 3] }]
    weighted_places = update_weights_for_age(data.user, weighted_initial)
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

  def update_weights_for_age(user, normalized_data)
    update_weights = normalized_data.each_pair.map do |place, weight|
      if user.age_range == 21
        case place.types.first
        when 'Brewery' then [place, weight += 2]
        when 'Irish Pub' then [place, weight += 2]
        when 'Beer Garden' then [place, weight += 2]
        when 'Gastropub' then [place, weight += 2]
        when 'Pizza Place' then [place, weight += 1]
        when 'Burger Joint' then [place, weight += 1]
        when 'Taco Place' then [place, weight += 1]
        when 'Mexican Restaurant' then [place, weight += 1]
        when 'Grocery Store' then [place, weight -= 2]
        else [place,weight]
        end
      end
    
      (weight += 3) if user.user_likes.pluck(:name).include?(place.name)
      (weight += 3) if user.checkins.pluck(:name).include?(place.name)
        
      [place, weight]
    end

    !!update_weights ? Hash[update_weights] : normalized_data
  end

end
