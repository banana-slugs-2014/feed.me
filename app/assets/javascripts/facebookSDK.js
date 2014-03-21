  window.fbAsyncInit = function() {
  FB.init({
    appId      : '702219983134648',
    status     : true, // check login status
    cookie     : true, // enable cookies to allow the server to access the session
    xfbml      : true  // parse XFBML
  });

  // THIS WILL LOG A USER OUT BEWARE - SHOULD REDIRECT
  $(".logout").on("click", function(){
    FB.logout(function(response) {
        // Person is now logged out
    });
  })
  // THIS WILL ALLOW USER POSTS TO FACEBOOK!
  $(".facebookPost").on("click", function(event){
    event.preventDefault();
      FB.login(function(response){
      $.ajax({
        type: "POST",
        url: 'users/login',
        data: response
      }).done(function(data){
        console.log(data);
      });
    },{scope: 'user_likes,user_checkins'}); // logins a user to your APP if they're logged in
  })

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

