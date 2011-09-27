var writeonly = {

	canUpdate: false,

	init: function() {
		$('#status').bind('input paste', writeonly.state);
		$('#commentform').submit(writeonly.submit);
		writeonly.state();
	},

	state: function() {
		var chars = $('#status').val().length;
		var charsRemaining = 140 - parseInt(chars, 10);
		var button = $('#update');
		if((chars == 0) || (chars > 140)) {
			writeonly.canUpdate = false;
			button.addClass('deactive').removeClass('primary');
		} else {
			writeonly.canUpdate = true;
			button.addClass('primary').removeClass('deactive');
		}
		$('#counter').text(charsRemaining);
	},

	submit: function() {
		return writeonly.canUpdate;
	}
};

$(function() {
	writeonly.init();
});
