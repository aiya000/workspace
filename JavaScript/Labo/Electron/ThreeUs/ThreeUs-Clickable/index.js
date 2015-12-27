'use strict';

function ThreeJsDimension (sceneWidth, sceneHeight) {
	// Create basic dimension
	var scene    = new THREE.Scene();
	var camera   = new THREE.PerspectiveCamera(75, sceneWidth / sceneHeight, 0.1, 1000);
	var renderer = new THREE.WebGLRenderer();
	renderer.setSize(sceneWidth, sceneHeight);
	camera.position.z = 5;

	var cube = new THREE.Mesh(
			new THREE.BoxGeometry(1, 1, 1),
			new THREE.MeshBasicMaterial({ color: 0x0ff00 })
			);
	scene.add(cube);

	// Set fields
	this.scene    = scene;
	this.camera   = camera;
	this.renderer = renderer;
	this.cube     = cube;
	//
	this.width    = sceneWidth;
	this.height   = sceneHeight;
}

ThreeJsDimension.prototype.startRender = function () {
	var self = this;
	(function render() {
		self.camera.z -= 0.1;
		requestAnimationFrame(render);
		self.renderer.render(self.scene, self.camera);
	})();
};

ThreeJsDimension.prototype.upToHtmlBody = function () {
	document.body.appendChild(this.renderer.domElement);
};

ThreeJsDimension.prototype.addMouseClickListener = function (action) {
	var self       = this;
	var mouse      = {x: 0.0, y: 0.0};
	var targetList = [this.cube];
	var projector  = new THREE.Projector();
	window.onclick = function (e) {
		if (e.target == self.renderer.domElement) {
			var rect = e.target.getBoundingClientRect();
			// ??? v
			mouse.x =  ((e.clientX - rect.left) / self.width)  * 2 - 1;
			mouse.y = -((e.clientY - rect.top)  / self.height) * 2 + 1;
			// ??? ^

			var vector = new THREE.Vector3(mouse.x, mouse.y, 1);
			// Convert coordinate system 'absolute' to 'camera'
			vector.unproject(self.camera);
			// Detect geometry click
			var ray    = new THREE.Raycaster(
					self.camera.position,
					vector.sub(self.camera.position).normalize()
					);
			var andSet = ray.intersectObjects(targetList);
			if (andSet.length > 0) {
				action();
			}
		}
	};
};

/* --- --- ---  --- --- --- */

var main = function () {
	var threeDim = new ThreeJsDimension(window.innerWidth, window.innerHeight);
	threeDim.upToHtmlBody();
	threeDim.startRender();
	threeDim.addMouseClickListener(function () {
		alert('foo');
	});
};
window.addEventListener('DOMContentLoaded', main, false);
