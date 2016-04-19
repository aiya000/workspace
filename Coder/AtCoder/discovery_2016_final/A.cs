using System;
using System.Linq;

class A {
	public static void Main(string[] args) {
		var prizes = new [] {
			  100000
			, 50000
			, 30000
			, 20000
			, 10000
		};
		var n = int.Parse(Console.ReadLine());
		var ids = Enumerable.Range(0, n)
			.Select(i => new {
					  Rank = i
					, Id   = int.Parse(Console.ReadLine())
			});
		ids.OrderBy(x => x.Id)
			.ToList()
			.ForEach(x =>
					Console.WriteLine(x.Rank >= prizes.Length ? 0 : prizes[x.Rank])
			);
	}
}
