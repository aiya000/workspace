using System;
using System.Linq;

class A {
	public static void Main(string[] args) {
		var xs = Console.ReadLine()
			.Split(' ')
			.Select(int.Parse);
		var a = xs.ElementAt(0);
		var b = xs.ElementAt(1);
		var signAreMinus = a < 0 && b < 0;
		var signArePlus  = a > 0 && b > 0;
		if (signAreMinus) {
			Console.WriteLine(Math.Abs(a) - Math.Abs(b));
		} else if (signArePlus) {
			Console.WriteLine(b - a);
		} else {
			if (a < 0) {
				Console.WriteLine(Math.Abs(b) - 1 - a);
			} else {
				Console.WriteLine(Math.Abs(a) - 1 - b);
			}
		}
	}
}
