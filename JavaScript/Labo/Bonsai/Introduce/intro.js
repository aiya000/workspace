bonsai.run(document.getElementById('movie'), {
	code: function () {
		new Rect(10, 10, 100, 100)
			.addTo(stage)
			.attr('fillColor', 'green');
	},
	width:  500,
	height: 400
});
