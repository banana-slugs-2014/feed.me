class FacebookFirstnamePlaces < RecommendationStrategy

  attr_reader :user, :places

  def recommend(data)
    @user = data.user
    @places = data.places

    first_letter_in_common
  end

  def first_letter_in_common
    firstname_letter = user.name[0]
    firstname_places = []
    places.each do |place|
      firstname_places << place if (place.name[0] == firstname_letter) || (place.address[0] == firstname_letter)
    end
    firstname_places
    firstname_places.empty? ? places.sample : firstname_places.sample
  end
end