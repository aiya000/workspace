/**
 * @classdesc
 */
function CanvasPlanet(canvas, x, y, radius, fill, onMouseClickAction) {
	// キャンバス惑星の大きさ
	this.x      = x;
	this.y      = y;
	this.radius = radius;
	this.onMouseClickAction = onMouseClickAction;

	this.context = canvas.getContext('2d');
	this.context.beginPath();
	this.context.arc(x, y, radius, 0, Math.PI * 2, false);
	if (fill) {
		this.context.fill();
	} else {
		this.context.stroke();
	}
}
