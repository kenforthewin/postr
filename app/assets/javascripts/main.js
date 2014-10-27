jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).on('page:load', function() {
	$(".upvote,.downvote").click(function() {
		$.get($(this).attr("href"), "script");
		return false;
	})
})