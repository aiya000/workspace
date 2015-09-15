// see http://dev.classmethod.jp/client-side/javascript/angularjs-q-promise/

angular
	.module("testPromise", [])
	.controller("PromiseController", ["$q", function ($q) {
		var asyncGetSum = function () {
			var defer = $q.defer();
			setTimeout(function () {
				var sum = 0;
				for (var i = 0; i < 99999; ++i) {
					sum += i;
				}
				defer.resolve(sum);
			}, 500);
			return defer.promise;
		};
		asyncGetSum().then(function (successCallback) {
			console.log(successCallback);
		});
		console.log("end");
	}]);
