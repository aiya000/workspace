/// <reference path="../typings/angularjs/angular.d.ts"/>

class SharedService {
	sharedElement: string = "homu";
}

interface FirstScope extends ng.IScope {
	firstElement: string;
}

interface SecondScope extends ng.IScope {
	secondElement: string;
}

interface ThirdScope extends ng.IScope {
	thirdElement: string;
}

angular
	.module("sharedServiceApp", [])
	.factory("SharedService", () => new SharedService())
	.controller("FirstController", ["$scope", "SharedService", ($scope: FirstScope, SharedService: SharedService) => {
		$scope.firstElement = SharedService.sharedElement;
	}])
	.controller("SecondController", ["$scope", "SharedService", ($scope: SecondScope, SharedService: SharedService) => {
		$scope.secondElement = SharedService.sharedElement;
		SharedService.sharedElement = "mado";
	}])
	.controller("ThirdControlelr", ["$scope", "SharedService", ($scope: ThirdScope, SharedService: SharedService) => {
		$scope.thirdElement = SharedService.sharedElement;
	}]);
