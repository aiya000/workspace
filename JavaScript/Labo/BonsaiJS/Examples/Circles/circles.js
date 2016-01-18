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
			new Circle(e.stageX, e.stageY, 10)
				.addTo(stage)
				.attr('fillColor', 'random');
		});
}
