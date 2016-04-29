using System;
using System.Linq;

class A {
	public static void Main(string[] args) {
		const string A = "TAKAHASHI";
		const string B = "AOKI";
		const string F = "DRAW";

		var xs = Console.ReadLine()
			.Split(' ')
			.Select(double.Parse);
		var a = xs.ElementAt(0);
		var b = xs.ElementAt(1);
		var c = xs.ElementAt(2);
		var d = xs.ElementAt(3);

		var x = b / a;
		var y = d / c;
		var ans = x == y ? F
		        : x >  y ? A
		                 : B;
		Console.WriteLine(ans);
	}
}

