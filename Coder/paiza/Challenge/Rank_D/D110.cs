using System;

public class Hello {
	public static void Main() {
		var foo = Console.ReadLine().Split(' ');
		Console.WriteLine("{0}.{1}", foo[0][0], foo[1][0]);
	}
}
