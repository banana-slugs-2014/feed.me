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
    var placesService = new google.maps.places.PlacesService(document.getElementById('hidden'));

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
          latitude: response[i].geometry.location.k,
          longitude: response[i].geometry.location.A
        })
      }
     $.ajax({
        url: '/places',
        type: 'POST',
        data: {places: JSON.stringify(places)}
      }).done(function(view){
        $('body').html(view)
        console.log('you did a thing!')
      }).fail(function(){
        console.log('ajax request to create a new restaurant failed')
      });

      // var nearestPlace = response[0].name + response[0].address;
      // view.renderPlace(nearestPlace);
    });
  }
}