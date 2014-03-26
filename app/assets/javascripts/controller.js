FeedMe.Controller = function(view, user, facebook){
  this.user = user;
  this.view = view;
  this.facebook = facebook;
}

FeedMe.Controller.prototype = {

  logOut: function(){
    this.facebook.logout(function(response){
      $.ajax({
        type: "DELETE",
        url: '/logout',
      }).done(function(response){
        console.log('logging out')
        window.location.href = '/'
      })
    });
  },

  logIn: function(){
    var self = this
    this.facebook.login(function(response){
      $.ajax({
        type: "POST",
        url: '/login',
        data: response
      }).done(function(data){
        console.log('logged in')
        if (data.id){
          self.getFacebookInfo(data.id)
        } else {
          self.view.renderUpdate(data)
        }
      });
    },{scope: 'user_likes,user_checkins,user_about_me,user_location,user_activities,user_relationships'});
  },

  getFacebookInfo: function(userId){
    var self = this
    this.facebook.api('/me?fields=id,name,checkins,age_range,gender,location,likes,address,languages,relationship_status,birthday',
      function(response){
        if (response && !response.error){
          $.ajax({
            type: "PUT",
            url: '/users/'+userId,
            data: response
          }).done(function(data){
            console.log('All your base are belong to us!')
            self.view.renderUpdate(data)
          })
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