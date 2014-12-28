// わからん。
import java.util.Scanner;

public class Sphinx {
	public static void main(String[] args){
		Scanner sin = new Scanner(System.in);
		int persons = sin.nextInt();
		int foots   = sin.nextInt();

		int[] result = sphinx(persons, foots);
		System.out.println(
				result[0] + " " + result[1] + " " + result[2]);
	}

	private static int[] sphinx(int persons, int foots){
		final int ADT_FOOTS = 2,
		          OLR_FOOTS = 3,
		          CHD_FOOTS = 4;
		final int[] anyFoot = { CHD_FOOTS, OLR_FOOTS, ADT_FOOTS };

		int[] persNum = new int[3];

		int calc;
		for(int i=calc=0; i<persNum.length; i++){
			int p;
			for(p=0; calc<foots; p++){
				calc += anyFoot[i];
				if(--persons < 
			}
			
			if(calc == foots)
				break;
			else
				calc -= anyFoot[i];

			persNum[i] = p;
		}

		return persNum;
	}
}
