FeedMe.Controller = function(view, user, facebook){
  this.user = user;
  this.view = view;
  this.facebook = facebook;
}

FeedMe.Controller.prototype = {

  logOut: function(){
    var self = this
    this.facebook.logout(function(response){
      var opts = {
        type: "DELETE",
        url: '/logout',
      }
    self.ajaxCaller(opts, self.view.redirectToHome)
    });
  },

  logIn: function(){
    var self = this
    this.facebook.login(function(response){
      opts = {
        type: "POST",
        url: '/login',
        data: response
      }
      self.ajaxCaller(opts, self.getFbInfoOrRenderUpdate)
    },{scope: 'user_likes,user_checkins,user_about_me,user_location,user_activities,user_relationships'});
  },

  getFbInfoOrRenderUpdate: function(data){
    if(data.id){
      FeedMe.view.getFacebookInfo(data.id)
    }else{
      FeedMe.view.renderUpdate(data)
    }
  },

  getFacebookInfo: function(userId){

    var self = this
    this.facebook.api('/me?fields=id,name,checkins,age_range,gender,location,likes,address,languages,relationship_status,birthday',
    function(response){
      if (response && !response.error){
        var opts = {
          type: "PUT",
          url: '/users/'+userId,
          data: response
        }
        self.ajaxCaller(opts, self.view.renderUpdate)
      }
    })
  },

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
    this.ajaxCaller(opts, this.view.showYes);
  },

  noAction: function(id){
    var opts = {
      url: '/recommendations/' + id ,
      type: 'put',
      context: this,
      data: {no: "no"}
    };
    this.ajaxCaller(opts, this.view.showNo );
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