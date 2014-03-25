HelpMe.Binder = function(sel, controller){
  this.sel = sel;
  this.controller = controller;
}

HelpMe.Binder.prototype = {

  bind: function(){
    this.bindFindLocationOnDocReady();
    this.bindfindPlaceButton();
    this.bindYesButton();
    this.bindNoButton();
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