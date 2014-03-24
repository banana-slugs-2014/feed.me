HelpMe.Binder = function(sel, controller){
  this.sel = sel;
  this.controller = controller;
}

HelpMe.Binder.prototype = {

  bind: function(){
    this.bindFindLocationOnDocReady();
    this.bindfindPlaceButton();
  },

  bindFindLocationOnDocReady: function(){
   this.controller.findUserLocation()
  },

  bindfindPlaceButton: function(){
    var controller = this.controller;
    // Protip:  Inject these selectors as part of an options object you pass in
    // during new HelpMe.Binder(...);  DEPENDENCY INJECTION
    $('body').on('click', ".helpMeButton" ,function(e){
      e.preventDefault();
      controller.findNearbyRestaurants();
    });
  }
}
