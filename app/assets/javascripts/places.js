$(document).ready(function(){
  var myUser = new User();
  myUser.getPos();
  var bindings = new Binder();
  bindings.bindRestaurant();

});


// THIS MAY BE BROKEN!?
Binder = {}

Binder.prototype = {
  bindings: function(){

  },
  bindRestaurant: function(){
    debugger;
    $('input').on('click', function(e){
      e.preventDefault();
      // $.ajax - create ajax here
      HelpMe.showNearbyRestaurants(myUser.position);
    })
  }
}


var User = function(){
  this.position = {}
}

User.prototype = {

  getPos: function(){
    var user = this
    navigator.geolocation.getCurrentPosition(function(position){
      user.setPos(position)});
  },
  setPos: function(geolocation){
    this.position = new google.maps.LatLng( geolocation.coords.latitude, geolocation.coords.longitude);
  }
}

var HelpMe = {}



HelpMe.showNearbyRestaurants = function(position){
  var service = new google.maps.places.PlacesService(document.getElementById('result'))
  var opts = {
    location: position,
    types: ['restaurant', 'food', 'cafe'],
    rankBy: google.maps.places.RankBy.DISTANCE
  }

  service.nearbySearch(opts, function(response){
    $('#result').append(response[0].name)
  });
}