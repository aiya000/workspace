// incompleted
using System;
using System.Linq;

public class Program {
	public static void Main(string[] args) {
		Console.ReadLine();
		Console.ReadLine();
		var xs = Console.ReadLine()
			.Split(' ')
			.Select(int.Parse);
		Console.ReadLine();
		var ys = Console.ReadLine()
			.Split(' ')
			.Select(int.Parse);
		var zs = ys.Except(xs)
			.Select(x => x.ToString())
			.ToArray();

		var ans = zs.Count() == 0 ? "None" : string.Join(" ", zs);
		Console.WriteLine(ans);
	}
}
