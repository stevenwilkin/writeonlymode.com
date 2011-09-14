var writeonly = {
	init: function() {
		$('#status').bind('input paste', writeonly.state);
		writeonly.state();
	},

	state: function() {
		var chars = $('#status').val().length;
		var charsRemaining = 140 - parseInt(chars, 10);
		var button = $('#update');
		if((chars == 0) || (chars > 140)) {
			button.addClass('deactive').removeClass('primary');
		} else {
			button.addClass('primary').removeClass('deactive');
		}
		$('#counter').text(charsRemaining);
	}
};

$(function() {
	writeonly.init();
});
