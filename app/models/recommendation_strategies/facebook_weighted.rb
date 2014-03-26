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


  class FbWeightCalculator
    BASELINE_WEIGHT = 3

    def initialize(type_bearer, age_bearer)
      @types = type_bearer.types
      @age_range = age_bearer.age_range
      @weight = BASELINE_WEIGHT
    end

    def weight
      privilege_fun_places_for_young_people!
      privilege_likes!
    end

    private

    def privilege_fun_places_for_young_people!
      return unless @age_range == 21
      @weight += ([ 'Brewery','Irish Pub','Beer Garden','Gastropub' ] & @types).length * 2   
    

#rinse repeat
        #   when 'Pizza Place','Burger Joint','Taco Place','Mexican Restaurant' then weight += 1
        #   when 'Grocery Store' then weight -= 2
        #   else weight
        # end
    end

    def privilege_likes!
    end

  end

  # FbWeightCalculator(place, user).weight # => 3

  def update_weights(user, normalized_data)
    update_weights = normalized_data.inject({}) do |updated, (place, weight)|
      #group the categories into similar weights
      #place.types.any?{|type| categories.include?(type)}
    
    # aggregate_weight = normalized_data.reduce(:+) do |place, weight|
    #   FbWeightCalculator(place, user).weight
    # end

      weight = FbWeightCalculator(place, user).weight
    
      (weight += 3) if user.user_likes.pluck(:name).include?(place.name)
      (weight += 3) if user.checkins.pluck(:name).include?(place.name)
        
      updated = updated.merge(place => weight)
    end
    update_weights
  end

end
