var main = function () {
	// View scene
	var scene    = new THREE.Scene();
	var camera   = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
	var renderer = new THREE.WebGLRenderer();
	camera.position.z = 5;
	renderer.setSize(window.innerWidth, window.innerHeight);
	document.body.appendChild(renderer.domElement);

	//
	var geometry  = new THREE.BoxGeometry(1, 1, 1);
	var matereial = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
	var cube      = new THREE.Mesh(geometry, matereial);
	scene.add(cube);

	// Render all
	console.log(cube.geometry);
	(function render() {
		requestAnimationFrame(render);
		renderer.render(scene, camera);
	})();
};

window.addEventListener('DOMContentLoaded', main, false);
