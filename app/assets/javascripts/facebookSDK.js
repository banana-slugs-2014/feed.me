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
    });
  })
  // THIS WILL ALLOW USER POSTS TO FACEBOOK!
  $(".facebookPost").on("click", function(){
    FB.ui(
      {
        method: 'feed'
      }
    ),
    FB.ui(
        {
         method: 'feed',
         name: 'Help.Me App',
         caption: 'Test Post',
         description: (
            'AWESOMEE'
         ),
         link: 'helpme.com',
         picture: 'http://www.fbrell.com/public/f8.jpg'
        },
        function(response) {
          if (response && response.post_id) {
            alert('Post was published.');
          } else {
            alert('Post was not published.');
          }
        }
    );
  })

  FB.Event.subscribe('auth.authResponseChange', function(response) {
    if (response.status === 'connected') {
      testAPI(); // test response
    } else if (response.status === 'not_authorized') {
      FB.login(); // logins a user to your APP if they're logged in
    } else {
      FB.login(); // logins a user to your APP and FACEBOOK
    }
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
    FB.api('/me', function(response) {
      debugger;
      console.log('Good to see you, ' + response.name + '.');
    });
  }