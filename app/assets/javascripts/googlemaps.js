var MapsMaker = function(){}

MapsMaker.prototype = {

  initializeMap: function(position){
    var mapOptions = {
      center: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
      zoom: 19
    };
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  },

  getLocation: function(){
    navigator.geolocation.getCurrentPosition(this.initializeMap)
  },

  findOrigin: function(){
    navigator.geolocation.getCurrentPosition(this.startDirections)
  },

  startDirections: function(position){
    var Origin = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
    var Destination = new google.maps.LatLng($('#latitude').text(), $('#longitude').text())

    var request = {
      origin: Origin,
      destination: Destination,
      travelMode: google.maps.TravelMode.WALKING
    }

    var directionsDisplay = new google.maps.DirectionsRenderer();
    var directionsServce = new google.maps.DirectionsService();
    directionsServce.route(request, function(result,status){
      directionsDisplay.setDirections(result)
      directionsDisplay.setMap(map);
    })
  },
}