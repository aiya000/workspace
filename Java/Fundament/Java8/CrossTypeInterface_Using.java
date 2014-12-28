import java.io.Serializable;


public class CrossTypeInterface_Using {
	public static void main(String[] args){
		new CrossTypeInterface_Using().crossTypeCast();
	}


	/* ** 交差型キャスト ** */
	interface CrossTypeInterface extends Runnable, Serializable {};//{{{
	private void crossTypeCast(){
		Runnable runner = (CrossTypeInterface)() -> System.out.println("CrossTypeInterface");
		System.out.println(runner instanceof Runnable);
		System.out.println(runner instanceof Serializable);
		runner.run();

		Runnable castRunner = (Runnable & Serializable)() -> System.out.println("Cross Type Cast");
		System.out.println(runner instanceof Runnable);
		System.out.println(runner instanceof Serializable);
		castRunner.run();

		lambdaPlace();
	}//}}}

	/* ** ラムダ式の展開される場所 ** */
	private void lambdaPlace(){
	}
}
