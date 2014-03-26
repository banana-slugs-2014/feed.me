HelpMe.View = function(sel){
  this.sel = sel;
}

HelpMe.View.prototype = {
  renderPlace: function(partial){
    $('body').html(partial);
  },
  showYes: function(partial){
    $('body').html(partial);
  },
  showNo: function(partial){
    $('body').html(partial);
  }
}