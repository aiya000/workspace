import java.util.Scanner;

//public class Main {
public class _40 {
	public static void main(String[] args){
		Scanner s = new Scanner(System.in);
		sequenceNumbers(s.nextInt(), s.nextInt());
	}

	public static void sequenceNumbers(int a, int b){
		System.out.print(a + " ");
		for(int i=0; i<8; i++)
			System.out.print( (a += b) + " " );
		System.out.println(a += b);
	}
}
