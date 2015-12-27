'use strict';

class ThreeJsDimension {
	constructor(sceneWidth, sceneHeight) {
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

	startRender() {
		var self = this;
		(function render() {
			requestAnimationFrame(render);
			self.renderer.render(self.scene, self.camera);
		})();
	}

	upToHtmlBody() {
		document.body.appendChild(this.renderer.domElement);
	}

	addMouseClickListener(action) {
		var mouse      = {x: 0.0, y: 0.0};
		var targetList = [this.cube];
		var projector  = new THREE.Projector();
		window.onmousedown = e => {
			if (e.target == this.renderer.domElement) {
				var rect = e.target.getBoundingClientRect();
				// ??? v
				mouse.x =  ((e.clientX - rect.left) / this.width)  * 2 - 1;
				mouse.y = -((e.clientY - rect.top)  / this.height) * 2 + 1;
				// ??? ^

				var vector = new THREE.Vector3(mouse.x, mouse.y, 1);
				vector.unproject(this.camera);
				var ray    = new THREE.Raycaster(
						this.camera.position,
						vector.sub(this.camera.position).normalize()
						);
				var andSet = ray.intersectObjects(targetList);
				if (andSet.length > 0) {
					action();
				}
			}
		};
	}
}

var main = () => {
	var threeDim = new ThreeJsDimension(window.innerWidth, window.innerHeight);
	threeDim.upToHtmlBody();
	threeDim.startRender();
	threeDim.addMouseClickListener(() => alert('foo'));
};
window.addEventListener('DOMContentLoaded', main, false);
