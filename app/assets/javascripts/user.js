var User = function(){
  this.position = {};
}

User.prototype = {

  getPos: function(){
    var user = this;
    navigator.geolocation.getCurrentPosition(function(position){
      user.setPos(position)});
  },
  setPos: function(geolocation){
    this.position = new google.maps.LatLng(geolocation.coords.latitude, geolocation.coords.longitude);
  }
}