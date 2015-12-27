bonsai.run(document.getElementById('scene'), {
	code: function () {
		for (var i = 0; i < 10; ++i) {
			var x      = Math.floor(Math.random() * 200) + 100;
			var y      = Math.floor(Math.random() * 200) + 100;
			var radius = Math.floor(Math.random() * 100) + 10;
			var color  = Math.floor(2147483647 / Math.random());
			var circlr = new Circle(x, y, radius)
				.addTo(stage)
				.attr('fillColor', color);
			
		}
	},
	width:  500,
	height: 400
});
