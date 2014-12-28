
public class Interface_Using {
	public static void main(String[] args){
		new Interface_Using().main();
	}

	// Interface_Using Implementation //{{{
	interface DefMount {
		default void method(){
			System.out.println("This method was not need implementation.");
		}
	}
	class Inheritance implements DefMount {}//}}}
	// Multi Inheritance //{{{
	interface FakeClassA {
		default void print(String s){
			System.out.println(s);
		}
	}
	interface FakeClassB {
		default String getString(){
			return "Multi Inheritance";
		}
	}
	class MultiInheritance implements FakeClassA, FakeClassB {
		public void start(){
			this.print(
				this.getString()
			);
		}
	}//}}}
	// Conflict Case of method //{{{
	interface ImplementateA {
		default void print(){ System.out.println("A"); }
	}
	interface ImplementateB {
		default void print(){ System.out.println("B"); }
	}
	class ConflictCase implements ImplementateA, ImplementateB {
		@Override
		public void print(){
			ImplementateA.super.print();
			ImplementateB.super.print();
		}
		public void calls(){ print(); }
	}//}}}
	// Static Method in Interface ////{{{
	interface HasMethod {
		public  static void print0(){System.out.println( "Public Static Method in Interface" );}
		// private static void print1(){System.out.println( "Public Static Method in Interface" );}
	}//}}}

	private void main(){
		new Inheritance().method();
		new MultiInheritance().start();
		new ConflictCase().calls();
		HasMethod.print0();
	}
}
