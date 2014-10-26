jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {
	$("#upvote").click(function() {
		$.get($(this).attr("href"), "script");
		return false;
	})
})