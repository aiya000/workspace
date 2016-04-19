using System;
using System.Linq;

class A {
	public static void Main(string[] args) {
		var lefts  = "QWERTYASDFGHZXCVB".ToArray();
		var c      = Console.ReadLine()[0];
		Console.WriteLine(lefts.Contains(c) ? "Left" : "Right");
	}
}
