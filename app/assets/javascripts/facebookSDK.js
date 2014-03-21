$(document).on('ready', function(){
  window.fbAsyncInit = function() {
  FB.init({
    appId      : '702219983134648',
    status     : true, // check login status
    cookie     : true, // enable cookies to allow the server to access the session
    xfbml      : true  // parse XFBML
  });

  App.controller = new App.Controller(FB);
  new App.Binder(App.controller).bind()

  FB.Event.subscribe('auth.authResponseChange', function(response) {
    if (response.status === 'connected') {
      testAPI(); // test response
    } else if (response.status === 'not_authorized') {
    FB.login(function(response){console.log(response)},{scope: 'user_likes,user_checkins'}); // logins a user to your APP if they're logged in
    } else {
    FB.login(function(response){console.log(response)},{scope: 'user_likes,user_checkins'}); // logins a user to your APP if they're logged in
    };
  });
  };

  // Load the SDK asynchronously
  (function(d){
   var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   ref.parentNode.insertBefore(js, ref);
  }(document));

  // Here we run a very simple test of the Graph API after login is successful.
  // This testAPI() function is only called in those cases.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me/permissions', function(response) {
      console.log(response.data[0]);
    });

    }

})