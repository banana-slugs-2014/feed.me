HelpMe.Controller = function(view, user){
  this.user = user;
  this.view = view;
}

HelpMe.Controller.prototype = {

  findUserLocation: function(){
    this.user.getPos();
  },

  findNearbyRestaurants: function(){
    var position = this.user.position;
    var view = this.view;

    //instantiate new google places service
    var placesService = new google.maps.places.PlacesService(document.getElementById('result'));

    //prepare options object to send to google places api
    var opts = {
      location: position,
      types: ['restaurant', 'food'],
      rankBy: google.maps.places.RankBy.DISTANCE
    };

    placesService.nearbySearch(opts, function(response){

      var places = []
      for(var i=0; i < response.length; i++){
        places.push({
          name: response[i].name,
          address: response[i].vicinity,
          types: response[i].types,
          latitude: response[0].geometry.location.k,
          longitude: response[0].geometry.location.A
        })
      }


      debugger

      // response = response[1];

      // var restaurantSuggestion = {
      //   name: response.name,
      //   address: response.vicinity,
      //   types: response.types,
      //   openNow: response.opening_hours.open_now
      // }

      $.ajax({
        url: '/create',
        type: 'POST',
        data: {places: JSON.stringify(places)}
      }).done(function(){
        console.log('you did a thing!')
      }).fail(function(){
        console.log('ajax request to create a new restaurant failed')
      });

      var nearestPlace = response[0].name;
      view.renderPlace(nearestPlace);
    });
  }
}