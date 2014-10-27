jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {
	$(".upvote,.downvote").click(function() {
		$.get($(this).attr("href"), $(this).attr("id"), "script");
		return false;
	})
})