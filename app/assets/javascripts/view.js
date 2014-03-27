FeedMe.View = function(sel, mapper){
  this.sel = sel;
  this.mapper = mapper;
}

FeedMe.View.prototype = {
  renderPlace: function(partial){
    $(FeedMe.view.sel.idBodySelector).html(partial);
    FeedMe.view.mapper.findOrigin();
  },
  showYes: function(partial){
    $(FeedMe.view.sel.idBodySelector).html(partial);
  },
  showNo: function(partial){
    $(FeedMe.view.sel.idBodySelector).html(partial);
    FeedMe.view.mapper.getLocation();
    FeedMe.view.mapper.findOrigin();
  },
  renderUpdate: function(partial){
    $(FeedMe.view.sel.idBodySelector).html(partial)
  },
  redirectToHome: function(){
    window.location.href = '/'
  }
}