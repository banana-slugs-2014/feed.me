HelpMe.View = function(sel){
  this.sel = sel;
}

HelpMe.View.prototype = {
  renderPlace: function(place){
    $(this.sel.resultContainerSelector).append(place);
  }
}