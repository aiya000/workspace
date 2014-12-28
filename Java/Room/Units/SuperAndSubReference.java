

public class SuperAndSubReference {

	class Super {
		public int id = 10;
		public void method(){
			System.out.println("Super");
		}
	};

	class Sub extends Super {
		public int id = 20;
		public void method(){
			System.out.println("Sub");
		}
	};

	public static void main(String[] args){
		new SuperAndSubReference().main();
	}

	private void main(){
		Sub ins0 = new Sub();
		//System.out.println(
		//	"Sub's ID: "   + ins0.id + "\n" +
		//	"Super's ID: " + ((Super)ins0).id
		//	);
		ins0.method();
		((Super)ins0).method();
	}
}
