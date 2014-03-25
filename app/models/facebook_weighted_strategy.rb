class FacebookWeightedStrategy < RecommendationStrategy

  def recommend(data)
    weighted_random(data)
  end

  private

  def weighted_random(data)
    weighted_initial = Hash[data.places.map{ |place| [place, 3] }]
    weighted_elements = update_weights_for_age(data.user.age_range, weighted_initial)

    weight_sum = weighted_elements.values.inject(:+)
    rand = Random.new.rand(weight_sum)


    selected_element = weighted_elements.detect do |place,weight|
      rand -= weight
      rand <= 0
    end

    selected_element.first
  end

  def update_weights_for_age(age, normalized_data)
    if age == 21
      update_weights = normalized_data.each_pair.map do |place, weight|
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
    end
    Hash[update_weights]
  end

end
