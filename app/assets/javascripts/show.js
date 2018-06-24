$(window).on("turbolinks:load",function(){
  $.ajax({
    url: '/users/1.json',
    dataType: 'JSON',
    method: 'GET',
    success: friendList
  });

  function friendList(data) {
    if(data.friendships.length > 0){
      var user = $.map(data.users, function(user){
        return user;
      });
      var friends = $.map(data.friendships, function(fr){
        return fr;
      });
      for(var i in user) {
        for(var j in friends) {
          var hrefPage = window.location.href;
          var idPage = hrefPage.replace('http://localhost:3000/friendships/', ' ');
          $('.media--friend_decline').html('<button>Decline</button>');

          if(user[i].id === friends[j].user_id && friends[j].friend_id == idPage){
            console.log("Кто принял заявку");
            var numAdd = 0;
            if(friends[j].accepted == false){
              numAdd ++;
              $("[data-behavior='numAdd']").text(numAdd);
            }else{
              $(".media--friend_accept").remove();
            }
            var user_name = user[i].first_name + " " + user[i].last_name;
            var email = "<strong>Email:</strong>" + " " + user[i].email;
            var avatar = "<img class='thumb media-object' src='" + user[i].avatar['url'] + "'>";

            $('h4.friends-name').html(user_name);
            $('address.friend-address').html(email);
            $('.pull-left__friend').html(avatar);
            $('.media--friend_accept').html('<button>Accept</button>');
            $('.media--friend_decline').html('<button>Decline</button>');

            $('.media--friend_decline').children().on('click', function(){
              $.ajax({
                url: "/friendships/" + idPage,
                method: 'DELETE',
                success: function(){
                  console.log("Succes");
                }
              });
            });

            $('.media--friend_accept').children().on('click', function(){
              $.ajax({
                url: "/friendships/" + idPage,
                method: 'PUT',
                success: function(){
                  console.log("Succes");
                }
              });
            });
          }
          else if(user[i].id === friends[j].friend_id && friends[j].user_id == idPage){
            console.log("Кто отправил заявку");
            var user_name = user[i].first_name + " " + user[i].last_name;
            var email = "<strong>Email:</strong>" + " " + user[i].email;
            var avatar = "<img class='thumb media-object' src='" + user[i].avatar['url'] + "'>";

            $('h4.friends-name').html(user_name);
            $('address.friend-address').html(email);
            $('.pull-left__friend').html(avatar);
          }
        }       
      }
    }
    else{
      $('.panel__friend').remove();
    }
  }
});
