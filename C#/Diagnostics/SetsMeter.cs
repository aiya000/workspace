using System;
using System.Collections.Generic;
using System.Diagnostics;


public class SetsMater {
	public static void Main(string[] args){
		var watcher   = new Stopwatch();
		var hashSet   = new HashSet<int>();
		var sortedSet = new SortedSet<int>();

		const int Count = 500000;
		var rand = new Random();
		var xs = new int[Count];
		for (int i = 0; i < Count; ++i) {
			xs[i] = rand.Next();
		}

		Console.WriteLine("HashSet<int> push start");
		watcher.Start();
		foreach (var x in xs) {
			hashSet.Add(x);
		}
		Console.WriteLine("Time: " + watcher.Elapsed);
		watcher.Reset();

		Console.WriteLine("SortedSet<int> push start");
		watcher.Start();
		foreach (var x in xs) {
			sortedSet.Add(x);
		}
		Console.WriteLine("Time: " + watcher.Elapsed);
		watcher.Reset();

		Console.WriteLine();

		Console.WriteLine("HashSet<int> hit start");
		watcher.Start();
		for (int i = 0; i < Count; ++i) {
			if (hashSet.Contains(i)) {
				Console.Write("*");
			}
		}
		Console.WriteLine("\nTime: " + watcher.Elapsed);
		watcher.Reset();

		Console.WriteLine("SortedSet<int> hit start");
		watcher.Start();
		for (int i = 0; i < Count; ++i) {
			if (sortedSet.Contains(i)) {
				Console.Write("*");
			}
		}
		Console.WriteLine("\nTime: " + watcher.Elapsed);
	}
}
