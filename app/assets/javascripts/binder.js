FeedMe.Binder = function(sel, controller){
  this.sel = sel;
  this.controller = controller;
}

FeedMe.Binder.prototype = {

  bind: function(){
    this.bindFbLogOut();
    this.bindFbLogIn();
    this.bindFindLocationOnDocReady();
    this.bindfindPlaceButton();
    this.bindToggleInfo();
    this.bindYesButton();
    this.bindNoButton();
    this.bindToggleInfo();
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
  },

  bindFindLocationOnDocReady: function(){
   this.controller.findUserLocation()
  },

  bindfindPlaceButton: function(){
    var controller = this.controller;
    $('body').on('click', ".helpMeButton" ,function(e){
      e.preventDefault();
      controller.findNearbyRestaurants();
    });
  },

  bindToggleInfo: function(){
    $('body').on('click', '#result', function(){
      $('#placeInfo').toggle();
    });
  },

  bindYesButton: function(){
    var controller = this.controller;
    $('body').on('click', ".yes" ,function(e){
      var id = e.target.dataset.id
      e.preventDefault();
      controller.yesAction(id);
    });
  },
  bindNoButton: function(){
    var controller = this.controller;
    $('body').on('click', ".no" ,function(e){
      var id = e.target.dataset.id
      e.preventDefault();
      controller.noAction(id);
    });
  }

}