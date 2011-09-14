var writeonly = {
	init: function() {
		$('#status').keyup(writeonly.keyup);
		writeonly.buttonState();
	},

	keyup: function() {
		writeonly.buttonState();
	},

	buttonState: function() {
		var chars = $('#status').val().length;
		var button = $('#update');
		if((chars == 0) || (chars > 140)) {
			button.addClass('deactive').removeClass('primary');
		} else {
			button.addClass('primary').removeClass('deactive');
		}
	}
};

$(function() {
	writeonly.init();
});
