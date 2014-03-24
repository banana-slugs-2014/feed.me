var User = function(){
  this.position = {};
}

User.prototype = {

  getPos: function(){
    var user = this;
    navigator.geolocation.getCurrentPosition(function(position){
      user.position = position.coords});
  }
}