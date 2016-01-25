bonsai.run(document.getElementById('scene'), {
	width:  500,
	height: 500,
	code:   main
});

function main() {
	new Rect(0, 0, 500, 500)
		.addTo(stage)
		.attr('fillColor', 'black')
		.on('pointermove', function (e) {
			var size = Math.random() * 30 + 10;
			new Circle(e.stageX, e.stageY, size)
				.addTo(stage)
				.attr({
					fillColor: 'random',
					scale:     Math.random() * 2 + 1
				})
				.animate('1s', {
					fillColor: 'random',
					opacity: 0,
					scale:   0
				}, {});
		});
}
