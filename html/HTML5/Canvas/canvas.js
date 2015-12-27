// see http://www.html5.jp/canvas/how2.html

onload = function () {
	drawSquare();
	drawSquare1();
	drawSquare2();
	clearPartOfSquare2();
	drawCircle();
	drawCircle1();
	drawCircle2();
	drawGeometry();
};

function drawSquare() {
	var canvas = document.getElementById('square');
	var context = canvas.getContext('2d');
	context.beginPath();
	context.moveTo(20, 20);
	context.lineTo(120, 20);
	context.lineTo(120, 120);
	context.lineTo(20, 120);
	context.closePath();
	context.stroke();
}

function drawSquare1() {
	var canvas = document.getElementById('square1');
	var context = canvas.getContext('2d');
	context.beginPath();
	context.strokeRect(20, 20, 100, 100);
	context.stroke();
}

function drawSquare2() {
	var canvas = document.getElementById('square2');
	var context = canvas.getContext('2d');
	context.beginPath();
	context.fillRect(20, 20, 100, 100);
	context.stroke();
}

function clearPartOfSquare2() {
	var canvas = document.getElementById('square2');
	var context = canvas.getContext('2d');
	context.beginPath();
	context.clearRect(20, 20, 80, 80);
	context.stroke();
}

function drawCircle() {
	var canvas = document.getElementById('circle');
	var context = canvas.getContext('2d');
	context.beginPath();
	context.arc(70, 70, 60, 0, Math.PI * 2, false);
	context.stroke();
}

function drawCircle1() {
	var canvas = document.getElementById('circle1');
	var context = canvas.getContext('2d');
	context.beginPath();
	context.arc(70, 70, 60, Math.PI * 0.5, Math.PI * 1.5, true);
	context.fill();
}

function drawCircle2() {
	var canvas = document.getElementById('circle2');
	var context = canvas.getContext('2d');
	context.beginPath();
	context.scale(2, 1);
	context.arc(70, 70, 40, 0, Math.PI * 2, false);
	context.stroke();
}

function drawGeometry() {
	var canvas = document.getElementById('geometry');

	var centerCircle = canvas.getContext('2d');
	centerCircle.beginPath();
	centerCircle.arc(140, 140, 20, 0, Math.PI * 2);
	centerCircle.fill();

	var surroundCircle = canvas.getContext('2d');
	surroundCircle.beginPath();
	surroundCircle.arc(140, 140, 60, 0, Math.PI * 2);
	surroundCircle.stroke();

	var edgeCircle1 = canvas.getContext('2d');
	edgeCircle1.beginPath();
	edgeCircle1.arc(90, 100, 15, 0, Math.PI * 2);
	edgeCircle1.fill();

	var edgeCircle2 = canvas.getContext('2d');
	edgeCircle2.beginPath();
	edgeCircle2.arc(180, 190, 15, 0, Math.PI * 2);
	edgeCircle2.fill();
}
