/**
 * @classdesc CanvasPlanetクラスとその座標を相対的に管理するクラス。
 */
function CanvasWorld(domElementId, x, y) {
	// CanvasPlanetインスタンスの相対座標のベース
	this.x = x;
	this.y = y;

	// planetsを乗せるcanvas DOM
	this.canvas = document.getElementById(domElementId);
	// 各惑星 [CanvasPlanet]
	this.planets = [];
}

/**
 * 惑星の作成メソッド。
 * @param number x CanvasWorldに対して相対的なx座標
 * @param number y CanvasWorldに対して相対的なy座標
 * @param number radius 
 */
CanvasWorld.prototype.newPlanet = function (x, y, radius) {
	var planetX = this.x + x;
	var planetY = this.y + y;
	var planet  = new CanvasPlanet(this.canvas, planetX, planetY, radius);
	this.planets.push(planet);
};
