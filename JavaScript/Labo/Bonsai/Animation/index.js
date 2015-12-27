bonsai.run(document.getElementById('scene'), {
	width:  1000,
	height: 1000,
	code: function () {
		new Circle(100, 100, 100)
			.addTo(stage)
			.attr('fillColor', 'random')
			.animate('2s', {
				x: 400,
				fillColor: 'random',
			}, {
				repeat: 10,
				easing: 'sineInOut'
			});
	}
});
