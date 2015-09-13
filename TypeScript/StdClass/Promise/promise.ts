//NOTE: Why start()'s first function got an undefined ?

/// <reference path="./promises-typescript/lib/Promises.ts"/>

/**
 * @namespace
 */
namespace HelloPromise {
	import Promise  = Promises.Promise;
	import Deferred = Promises.Deferred;

	function asyncGetFoo() : Promise {
		const RIGHT_VAL = 4999850001;
		var defer       = new Deferred();
		var sum: number = 0;
		for (let i = 0; i < 99999; ++i) {
			sum += i;
		}

		if (sum != RIGHT_VAL) {
			defer.reject(sum);
		} else {
			defer.resolve(sum);
		}
		return defer.promise();
	}

	export function start() : void {
		asyncGetFoo().then((rightData: number) => {
			console.log("Succeed calculate: " + rightData);
		}, (leftData: number) => {
			console.log("Calculate failure");
			console.log("result: " + leftData);
		});
	}
}

HelloPromise.start();
