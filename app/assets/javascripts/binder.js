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
    $(this.sel.helpMeButtonSelector).on('click', function(e){
      e.preventDefault();
      controller.findNearbyRestaurants();
    });
  }
}