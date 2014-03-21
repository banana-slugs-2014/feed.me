$(document).ready(function(){
  var myUser = new User();
  myUser.getPos();

  $('input').on('click', function(e){
    e.preventDefault()
    HelpMe.showNearbyRestaurants(myUser.position);
  })

});


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
  // var nearbyArea = new google.maps.places.PlacesService.nearbySearch(position)
  // console.log(nearbyArea)
  var opts = {
    location: position,
    // radius: 3000,
    types: ['restaurant', 'food', 'cafe'],
    rankBy: google.maps.places.RankBy.DISTANCE
  }

  service.nearbySearch(opts, function(response){
    $('#result').append(response[0].name)
  });
}