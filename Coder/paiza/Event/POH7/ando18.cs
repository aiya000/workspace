using System;
using System.Collections.Generic;
using System.Linq;

class CatQueue<T> {
	private const int Range = 3;
	private IEnumerable<T> queue;
	private T[] whole;
	private int currentHead = 0;

	public T[] Queue {
		get {
			return this.queue.ToArray();
		}
	}

	public CatQueue(T[] whole) {
		this.whole = whole;
		this.queue = whole.Take(Range);
	}

	public void ShiftLeft() {
		this.queue = whole.Skip(++currentHead).Take(Range);
	}
}

static class CatQueueExt {
	public static string AsCatString(this CatQueue<char> catq) {
		return string.Concat(catq.Queue);
	}
}

class Program {
	public static void Main(string[] args) {
		var cat  = Console.ReadLine().ToCharArray();
		var catq = new CatQueue<char>(cat);
		var ans  = Enumerable.Range(0, cat.Length - 2)
			.Aggregate(0, (ac,x) => {
				var incVal = catq.AsCatString() == "cat" ? 1 : 0;
				catq.ShiftLeft();
				return ac + incVal;
			});
		Console.WriteLine(ans);
	}
}
