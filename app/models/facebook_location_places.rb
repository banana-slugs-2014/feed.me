class FacebookLocationPlaces < RecommendationStrategy

  def recommend(data)
    @user = data.user
    @places = data.places
    p "&" * 100

    regional
  end

  def regional
    regional_letter = @user.location[0]
    regional_places = []
    @places.each do |place|
      regional_places << place if place.name[0].include?(regional_letter) || place.address[0].include?(regional_letter)
    end
    p regional_places
    regional_places.empty? ? @places.sample : regional_places.sample
  end
end