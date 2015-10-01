angular
	.module("templateBind", [])
	.controller("Controller", ["$scope", function ($scope) {
		$scope.foo = "siri";
	}])
	.directive("okDirective", function () {
		return {
			  restrict    : "A"
			, templateUrl : "./template.html"
		};
	});
