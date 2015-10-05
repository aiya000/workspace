angular
	.module("kotohono", [])
	.controller("honokaChan", ["$scope", function ($scope) {
		$scope.chocolate = "oishi-ne!";
	}])
	.directive("chuNDirective", function () {
		return {
			  restrict : "A"
			, template : "<div>honoka-chan, {{ chocolate }}</div>"
		};
	})
	.directive("honoDirective", function () {
		return {
			  restrict : "A"
			, scope    : true  // better
			, template : "<div>kotori-chan, {{ chocolate }}</div>"
		};
	});
