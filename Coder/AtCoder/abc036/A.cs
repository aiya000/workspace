using System;
using System.Linq;

public class Program {
	public static void Main(string[] args) {
		var xs = Console.ReadLine()
			.Split(' ')
			.Select(int.Parse);
		var num   = xs.ElementAt(0);
		var want  = xs.ElementAt(1);
		var count = 1;
		for (var i = num; want > i; i += num) {
			++count;
		}
		Console.WriteLine(count);
	}
}
