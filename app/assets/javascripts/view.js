FeedMe.View = function(sel){
  this.sel = sel;
}

FeedMe.View.prototype = {
  renderPlace: function(partial){
    $('body').html(partial);
  },
  showYes: function(partial){
    $('body').html(partial);
  },
  showNo: function(partial){
    $('body').html(partial);
  },
  renderUpdate: function(partial){
    $('#body').html(partial)
  }
}