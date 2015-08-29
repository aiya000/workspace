// create
var appOnLoad = angular.module("appOnLoad", []);

// register
appOnLoad.factory("foofooOnLoad", [function () {
	return {name: "neko"};
}]);

// implement
appOnLoad.run(["foofooOnLoad", function (foofooOnLoad) {
	alert(foofooOnLoad.name + "_thunder !!");
}]);
