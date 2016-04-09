using System;
using System.Linq;

class Program {
	public static void Main(string[] args) {
		var cs = Console.ReadLine()
			.Split(' ')
			.Select(s => s.ToUpper()[0]);
		var ans = cs.ElementAt(0) == cs.ElementAt(1) ? "Yes" : "No";
		Console.WriteLine(ans);
	}
}
