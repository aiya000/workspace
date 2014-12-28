import java.util.Properties;
import java.io.*;
import java.util.function.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.*;
import java.util.stream.*;
import java.nio.file.Paths;

public class ReAbstractalize {
	abstract class A { abstract void f(); }
	class B extends A { void f(){} };
	abstract class C extends B { abstract void f(); }
	class D extends C { void f(){ System.out.println("ooooo!!!!"); } };
	public static void main(String[] args){
		new ReAbstractalize().main();
	}
	private void main(){
		new D().f();
	}
}
