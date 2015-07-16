using System;


public interface IFoo {
	int X { get; set; }
}

public struct Foo : IFoo {
	public int X { get; set; }
}


public class StructExtInterface {
	public static void Method(IFoo x) {
		x.X = 10;
	}
	public static void Main(string[] args){
		IFoo a = new Foo();
		Foo  b = new Foo();
		a.X = 0;
		b.X = 0;
		Method(a);
		Method(b);
		Console.WriteLine(a.X);
		Console.WriteLine(b.X);
	}
}
