var App = {}

App.Controller = function(facebook, view){
  this.facebook = facebook
  this.view = view
};

App.Controller.prototype = {
  logOut: function(){
    this.facebook.logout(function(response){
      $.ajax({
        type: "DELETE",
        url: '/logout',
      }).done(function(response){
        console.log('logging out')
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
      }).done(function(views){
        console.log('calling facebook info')
        self.getFacebookInfo()
        self.view.renderUpdate(views)
      });
    },{scope: 'user_likes,user_checkins,user_about_me,user_birthday,user_location,user_activities,user_relationships'});
  },

  getFacebookInfo: function(){
    this.facebook.api('/me?fields=id,name,checkins,age_range,gender,location,likes,address,languages,relationship_status,birthday',
      function(response){
        if (response && !response.error){
          $.ajax({
            type: "PUT",
            url: '/users/'+response.id,
            data: response
          }).done(function(data){
            console.log('All your base are belong to us!')
          })
        }
      })
  }
}

App.View = function(){}

App.View.prototype = {
  renderUpdate: function(data){
    $('body').html(data)
  }
}

App.Binder = function(controller){
  this.controller = controller
}

App.Binder.prototype = {
  bind: function(){
    this.bindFbLogOut();
    this.bindFbLogIn();
  },

  bindFbLogOut: function(){
    var self = this
    $(".logout").on("click", function(event){
      event.preventDefault()
      self.controller.logOut()
    })
  },

  bindFbLogIn: function(){
    self = this
    $(".facebookLogin").on("click", function(event){
      event.preventDefault();
      self.controller.logIn()
    })
  }
}
