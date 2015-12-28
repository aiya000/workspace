bonsai.run(document.getElementById('scene'), {
	width:  500,
	height: 500,
	code:   main
})
.on('load', function () {
	alert('loaded');
	this.on('message:click', function () {
		alert('clicked');
	});
});

function main() {
	new Circle(100, 100, 60)
		.addTo(stage)
		.attr('fillColor', 'random')
		.on('click', function (e) {
			console.log('clicked');
			//alert('clicked');
			stage.sendMessage('click', {});
		})
		.on('pointermove', function (e) {
			this.fill('random');
		});
};
