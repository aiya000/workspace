'use strict';

var main = function () {
	// Create scene
	var scene    = new THREE.Scene();
	var camera   = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
	var controls = new THREE.OrbitControls(camera);
	var renderer = new THREE.WebGLRenderer();
	renderer.setSize(window.innerWidth, window.innerHeight);
	camera.position.z = 5;
	document.body.appendChild(renderer.domElement);

	// Put cube
	var cube = new THREE.Mesh(
			new THREE.BoxGeometry(1, 1, 1),
			new THREE.MeshBasicMaterial({ color: 0x0ff00 })
			);
	scene.add(cube);

	// View all
	(function render() {
		requestAnimationFrame(render);
		renderer.render(scene, camera);
		controls.udpate();
	})();
};

window.addEventListener('DOMContentLoaded', main, false);
