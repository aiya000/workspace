import java.util.List;
import java.util.Arrays;

public class IntroJava8 {
	public static void main(String[] args){
		System.out.println("参照:\n  http://dev.ariel-networks.com/wp/archives/4207\n");

		IntroJava8 intro = new IntroJava8();
		
		System.out.println("Java8 Lambda Expression");
		intro.lambda();

		System.out.println("Java8 Method Reference");
		intro.method();
		
		System.out.println("Java8 Stream API");
		intro._stream();
	}

	/* Lambda */ //{{{

	private interface HasSingle { void hoge(); }
	private interface TypeInference { void hoge(String value); }
	private interface HasSingle0 { void hoge(int n); }

	private int a = 20;
	private static int b = 30;

	public         void dPrint(){ System.out.println("called -> public void IntroJava8#dPrint();");         }
	private static void sPrint(){ System.out.println("called -> private static void IntroJava8#sPrint();"); }
	public void lambda(){

		// This interface has Single Method only
		// and segment block was omitted.
		HasSingle lambda = () -> System.out.println("hoge foo");
		lambda.hoge();

		// Argument was type inference
		String arg = "Type Inference";
		TypeInference lambda0 = (value) -> { System.out.println(arg); };
		lambda0.hoge(arg);

		// This is a Scope Test
		int c = -1;
		final int d = 10;
		HasSingle scope = () -> {
			// Cannot refer to local variables
			//System.out.println(c);
			// Can refer to local final variables
			System.out.println(d);

			// Can operating instance's and class's scope variable
			a++;
			System.out.println(a);
			b++;
			System.out.println(b);
		};
		scope.hoge();

		// Method Scope
		HasSingle call = () -> {
			dPrint();
			sPrint();
		};
		call.hoge();
	}

	//}}}

	/* Method Reference */ //{{{
	public void method(){

		List<Integer> list = Arrays.asList(1,2,3,4,5);
		// Exam for Lambda
		list.forEach(x -> System.out.print(x));
		System.out.println();
		// Exam for Method Reference
		list.forEach(System.out::print);
		System.out.println();

		System.out.println("よくわからないけどすごい！！");
	}
	//}}}

	/* Stream API */ //{{{
	public void _stream(){
		System.out.println("すごすぎてまとめられてないの。");
	}
	//}}}

}
