HelpMe.Binder = function(sel, controller){
  this.sel = sel;
  this.controller = controller;
}

HelpMe.Binder.prototype = {

  bind: function(){
    this.bindFindLocationOnDocReady();
    this.bindfindPlaceButton();
    this.bindToggleInfo();
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
  }

}