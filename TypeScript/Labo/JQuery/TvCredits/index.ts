/// <reference path="../typings/jquery/jquery.d.ts" />
/// <reference path="../typings/jquery.tvcredits/jquery.tvcredits.d.ts" />

$(document).ready(() => {
	$("#credits").css("mergin-top", "10000px");
	$("#credits").tvCredits({
		  height   : $("#credits").height() * 2
		, speed    : 10000
		, complete : () => {
			$("#credits").text("");
			$("#credits").fadeOut();
		}
	});
});
