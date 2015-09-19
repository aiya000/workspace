var app = angular.module("foo", []);
app.controller("fooController", ["$scope", function ($scope) {
	$scope.f = function () {
		console.log($scope);
	};
}]);
