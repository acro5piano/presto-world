// TODO: 開発環境とそれ以外で分ける
var appId = '1252598184786360';

window.fbAsyncInit = function() {
  FB.init({
    appId      : appId,
    xfbml      : true,
    version    : 'v2.8'
  });
};

(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ja_JP/sdk.js#xfbml=1&version=v2.8&appId=" + appId;
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

$(document).on('ready', function() {
  $('.fb-register').on('click', function() {
    FB.getLoginStatus(function(response) {
      if (response.status === 'connected'){
        console.log('already logged in')
        return
      } else {
        FB.login(function(response) {
          if (response.status === 'connected') {
            console.log('connected')
            window.location.href = '/register_with_facebook?token='+
                                    response.authResponse.accessToken
          } else if (response.status === 'not_authorized') {
            console.log('not auth')
          } else {
            console.log('not log in facebook')
          }
        }, {scope: 'email'})
      }
    })
  })

  $('.fb-logout').on('click', function() {
    FB.getLoginStatus(function(response) {
      if (response.status !== 'connected'){
        console.log('not logged in')
        return
      } else {
        FB.logout()
      }
    })
  })
})
