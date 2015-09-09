// http://github.com/rosantoz/tvcredits

$(document).ready(function () {
	$("#credits").tvCredits({
		  height   : $("#credits").height() * 2
		, speed    : 2000
		, complete : function () {
			$("#credits").text("");
			$("#credits").fadeOut();
		}
	});
});
