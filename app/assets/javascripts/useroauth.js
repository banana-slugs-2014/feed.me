var App = {}

App.Controller = function(facebook){
  this.facebook = facebook
};

App.Controller.prototype = {
  logOut: function(){
    this.facebook.logout(function(response){
      $.ajax({
        type: "DELETE",
        url: '/logout',
      }).done(function(response){
      console.log('logging out')
      //this.view.doSomething
      })

    });
  },

  logIn: function(){
    this.facebook.login(function(response){
      $.ajax({
        type: "POST",
        url: '/login',
        data: response
      }).done(function(data){
        //this.view.doSomething
        console.log("logging in");
      });
    },{scope: 'user_likes,user_checkins'});
  },
}

App.View = function(){}

App.View.prototype = {

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
