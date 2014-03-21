var HelpMe = {};


$(document).ready(function(){

  var myUser = new User();

  var Selectors = {
    resultContainerSelector: '#result',
    helpMeButtonSelector: '.helpMeButton'
  }

  HelpMe.view = new HelpMe.View(Selectors);
  HelpMe.controller = new HelpMe.Controller(HelpMe.view, myUser);
  new HelpMe.Binder(Selectors, HelpMe.controller).bind();

});


