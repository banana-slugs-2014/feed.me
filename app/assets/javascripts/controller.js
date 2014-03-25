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
    var opts = {
      url: '/places',
      type: 'post',
      context: this,
      data: {userLocation: JSON.stringify(position)}
    };
    this.ajaxCaller(opts, this.view.renderPlace);
  },

  yesAction: function(id){
    var opts = {
      url: '/recommendations/' + id ,
      type: 'put',
      context: this,
      data: {yes: "yes"}
    };
    this.ajaxCaller(opts, this.view.showSuccess);
  },

  noAction: function(id){
    var opts = {
      url: '/recommendations/' + id ,
      type: 'put',
      context: this,
      data: {no: "no"}
    };
    this.ajaxCaller(opts, this.view.showSuccess );
  },

  ajaxCaller: function(opts, callback){
    $.ajax(opts)
    .done(function(response){
      callback(response)
    })
    .fail(function(){
      console.log('ajax request to create a new restaurant failed')
    });
  }
}