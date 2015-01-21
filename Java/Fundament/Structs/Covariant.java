import java.util.List;
import java.util.ArrayList;

public class Covariant {
	public static void main(String[] args){
		new Covariant().main();
	}


	/* ** 共変戻り値の関係 ** */
	// ( => C <-> D )
	class A{};
	class B extends A{};
	class C {
		public A getA(){
			return new A();
		}
	};
	class D extends C {
		@Override
		public B getA(){
			return new B();
		}
	}

	private void main(){
		A b = new D().getA();
		System.out.println(b.getClass().getName());
		main(1);
	}

	/* ** 配列は共変 ** */
	private void main(int _1){
		A[] co = new B[0];
		System.out.println(co);
		//List<A> noco = new ArrayList<B>();
		//System.out.println(noco);
		List <? extends A> co2 = new ArrayList<B>();
		System.out.println(co2.getClass().getName());
	}
}
