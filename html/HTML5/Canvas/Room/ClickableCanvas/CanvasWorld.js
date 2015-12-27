/**
 * @classdesc CanvasPlanetクラスとその座標を相対的に管理するクラス。
 */
function CanvasWorld(domElementId, x, y) {
	var self = this;

	// CanvasPlanetインスタンスの相対座標のベース
	this.x = x;
	this.y = y;

	// planetsを乗せるcanvas DOM
	this.canvas = document.getElementById(domElementId);
	// 各惑星 [CanvasPlanet]
	this.planets = [];

	// どの惑星がクリックされたか判別
	this.canvas.addEventListener('mouseup', function (event) {
		for (var i = 0; i < self.planets.length; ++i) {
			var planet = self.planets[i];
			var planetClientX = self.canvas.offsetLeft + planet.x;
			var planetClientY = self.canvas.offsetTop  + planet.y;
			var planetClicked =
				planet.x < event.clientX && event.clientX < (planetClientX + planet.radius) &&
				planet.y < event.clientY && event.clientY < (planetClientY + planet.radius);
			if (planetClicked && planet.onMouseClickAction != null) {
				planet.onMouseClickAction();
			}
		}
	}, false);
}

/**
 * 惑星の作成メソッド。
 * @param number  x CanvasWorldに対して相対的なx座標
 * @param number  y CanvasWorldに対して相対的なy座標
 * @param number  radius 円の半径
 * @param boolean fill   塗りつぶす
 */
CanvasWorld.prototype.newPlanet = function (x, y, radius, fill, onMouseClickAction) {
	var planetX = this.x + x;
	var planetY = this.y + y;
	var planet  = new CanvasPlanet(this.canvas, planetX, planetY, radius, fill, onMouseClickAction);
	this.planets.push(planet);
};
