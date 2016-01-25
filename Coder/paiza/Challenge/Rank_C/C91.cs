using System;

public class Hello {
	private static int _1 = 0;
	private static int _2 = 0;
	public static void Main() {
		var n = int.Parse(Console.ReadLine());
		// indent sugoi
		for (var i = 0; i < n; ++i) {
			var op = Console.ReadLine().Split(' ');
			switch (op[0]) {
				case "SET":
					switch (op[1]) {
						case "1":
							_1 = int.Parse(op[2]);
							break;
						case "2":
							_2 = int.Parse(op[2]);
							break;
					}
					break;
				case "ADD":
					_2 = _1 + int.Parse(op[1]);
					break;
				case "SUB":
					_2 = _1 - int.Parse(op[1]);
					break;
			}
		}
		Console.WriteLine("{0} {1}", _1, _2);
	}
}
