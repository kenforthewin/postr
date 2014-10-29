jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})


vote = function() {
	$(".upvote,.downvote").click(function() {
		$.get($(this).attr("href"), "script");
		return false;
	});
}

comments = function() {
	$("#comment_form").submit(function() {
		$.post($(this).attr("action"), $(this).serialize(), null, "script");
		return false;
	});	
};

$(document).ready(comments);
$(document).on('page:load', comments);
$(document).ready(vote);
$(document).on('page:load', vote);