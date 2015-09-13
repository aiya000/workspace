/**
 * @namespace
 */
var HelloPromiss = {
	asyncGetFoo: function () {
		return new Promise(function (resolve, reject) {
			var RIGHT_VAL = 4999850001;
			var sum       = 0;
			for (var i = 0; i < 99999; ++i) {
				sum += i;
			}

			if (sum != RIGHT_VAL) {
				reject(sum);
				return;
			}
			resolve(sum);
		});
	}

	, start: function () {
		HelloPromiss.asyncGetFoo().then(function (rightData) {
			console.log("Succeed calculate: " + rightData);
		}, function (leftData) {
			console.log("Calculate failure");
			console.log("result: " + leftData);
		});
	}
}

HelloPromiss.start();
