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
    this.bindYesButton();
    this.bindNoButton();
  },

  bindFbLogOut: function(){
    var self = this
    $(this.sel.bodySelector).on("click", this.sel.logoutButtonSelector, function(e){
      e.preventDefault()
      self.controller.logOut()
    })
  },

  bindFbLogIn: function(){
    self = this
    $(this.sel.loginButtonSelector).on("click", function(e){
      e.preventDefault();
      self.controller.logIn()
    })
  },

  bindFindLocationOnDocReady: function(){
   this.controller.findUserLocation()
  },

  bindfindPlaceButton: function(){
    var controller = this.controller;
    $(this.sel.bodySelector).on('click', this.sel.helpMeButtonSelector,function(e){
      e.preventDefault();
      controller.findNearbyRestaurants();
    });
  },

  bindYesButton: function(){
    var controller = this.controller;
    $(this.sel.bodySelector).on('click', this.sel.yesButtonSelector ,function(e){
      var id = e.target.dataset.id
      e.preventDefault();
      controller.yesAction(id);
    });
  },
  bindNoButton: function(){
    var controller = this.controller;
    $(this.sel.bodySelector).on('click', this.sel.noButtonSelector,function(e){
      var id = e.target.dataset.id
      e.preventDefault();
      controller.noAction(id);
    });
  }

}