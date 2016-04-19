using System;
using System.Linq;

public class A {
	public static void Main(string[] args) {
		var xs = Console.ReadLine()
			.Split(' ')
			.Select(int.Parse);
		var x = xs.ElementAt(0);
		var y = xs.ElementAt(1);
		Console.WriteLine(x <= y ? "Better" : "Worse");
	}
}
