using System;

class A {
	public void F() {
		Console.WriteLine("A");
	}
}
class B : A {
	public void F() {
		Console.WriteLine("B");
	}
}

class C {
	public virtual void G() {
		Console.WriteLine("C");
	}
}
class D : C {
	public override void G() {
		Console.WriteLine("D");
	}
}

public class RequireOverride {
	public static void Main(string[] args){
		var x = new B();
		x.F();
		((A)x).F();

		var y = new D();
		y.G();
		((C)y).G();
	}
}
