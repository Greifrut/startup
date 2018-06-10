$(document).ready(function(){
  $.ajax({
    url: '/friendships/1.json',
    dataType: 'JSON',
    method: 'GET',
    success: function(data){
      if(data.length){
        items = "<div><h3>Accept</h3></div> ";
        $('.friends_list').html(items);
      }
    }
  });
});

$(document).ready(function(){
  $('.decline_friend').on('click', function(){
    $.ajax({
      url: '/friendships/2',
      method: 'DELETE',
      success: function(){
        console.log("Succes");
      }
    });
  });
});