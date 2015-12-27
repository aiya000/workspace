var go = new CanvasWorld('go', 20, 20);
go.newPlanet(20, 20, 20, false);
go.newPlanet(60, 60, 20, false);
go.newPlanet(20, 60, 20, true);
go.newPlanet(60, 20, 20, true);

var world = new CanvasWorld('world', 20, 20);
world.newPlanet(50,   50, 30, true, function () {  // 中心
	alert('x');
});
world.newPlanet(50,   50, 60, false); // 丸枠
world.newPlanet(5,    10, 17, true, function () {
	alert('y');
});
world.newPlanet(100,  10, 20, true, function () {
	alert('z');
});
world.newPlanet(7,    95, 15, true, function () {
	alert('a');
});
world.newPlanet(70,  110, 15, true, function () {
	alert('b');
});
