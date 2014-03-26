FeedMe.View = function(sel){
  this.sel = sel;
}

FeedMe.View.prototype = {
  renderPlace: function(partial){
    $(FeedMe.view.sel.bodySelector).html(partial);
  },
  showYes: function(partial){
    $(FeedMe.view.sel.bodySelector).html(partial);
  },
  showNo: function(partial){
    $(FeedMe.view.sel.bodySelector).html(partial);
  },
  renderUpdate: function(partial){
    $(FeedMe.view.sel.idBodySelector).html(partial)
  },
  redirectToHome: function(){
    window.location.href = '/'
  }
}