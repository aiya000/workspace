using System;
using System.Linq;

class A {
	public static void Main(string[] args) {
		var ad = Console.ReadLine()
			.Split(' ')
			.Select(int.Parse);
		var a = ad.ElementAt(0);
		var d = ad.ElementAt(1);
		var ans = (a + 1) * d >= a * (d + 1) ? (a + 1) * d : a * (d + 1);
		Console.WriteLine(ans);
	}
}
