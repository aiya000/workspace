angular
	.module("sharedServiceApp", [])
	.factory("SharedService", function () {
		return {
			sharedElement: "homu"
		};
	})
	.controller("FirstController", ["$scope", "SharedService", function ($scope, SharedService) {
		$scope.firstElement = SharedService.sharedElement;
	}])
	.controller("SecondController", ["$scope", "SharedService", function ($scope, SharedService) {
		$scope.secondElement = SharedService.sharedElement;
		SharedService.sharedElement = "mado";
	}])
	.controller("ThirdControlelr", ["$scope", "SharedService", function ($scope, SharedService) {
		$scope.thirdElement = SharedService.sharedElement;
	}]);
