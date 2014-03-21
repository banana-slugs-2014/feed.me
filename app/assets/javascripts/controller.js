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
      types: ['restaurant', 'food', 'cafe'],
      rankBy: google.maps.places.RankBy.DISTANCE
    };

    placesService.nearbySearch(opts, function(response){
      var nearestPlace = response[0].name;
      view.renderPlace(nearestPlace);
    });
  }
}