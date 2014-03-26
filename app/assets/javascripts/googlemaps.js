function getLocation(){
  navigator.geolocation.getCurrentPosition(showPosition)
}

function showPosition(position){
  var latlon = position.coords.latitude + "," + position.coords.longitude;

  var mapOptions = {
      zoom: 19,
      center: new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
  };

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}