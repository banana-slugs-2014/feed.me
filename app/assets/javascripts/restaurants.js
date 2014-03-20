$(document).ready(function(){
  var myuser = new User();
  myuser.getPos();
  console.log(myuser.position)
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
    this.position.coords = geolocation.coords
  }
}
