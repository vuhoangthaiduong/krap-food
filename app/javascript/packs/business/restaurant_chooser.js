$("document").ready(function(){
  $(".user-restaurant").on('click', function(e){
    var restaurant_id = $(this).data("restaurant-id");
    console.log(restaurant_id);
    $.ajax({
	    url: `/business/dashboards/choose_restaurant/${restaurant_id}`,
	    method: "GET",  
	    error: function (xhr, status, error) {
	      console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      console.log(response);
	    }
  	});
  });
});
