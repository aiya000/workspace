import java.io.BufferedReader;
import java.io.InputStreamReader;

/*
 * 2014-04-29
 * start - 21:04
 * end   - 21:27
 */

public class Abc001 {
	public static void main(String[] args){
		new Abc001().main();
	}

	public void main(){
		int result = 0;
		String msg = null;
		try{

			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			String lines[] = new String[3];
			for(int i=0; i<lines.length; i++)
				lines[i] = in.readLine();

			int fst = Integer.parseInt(lines[0]);
			if( !(1<= fst && fst <= 1000) )
				throw new RuntimeException("fst");

			String nums[] = lines[1].split(" ");
			int snd = Integer.parseInt(nums[0]);
			if( !(1<= snd && snd <= 1000) )
				throw new RuntimeException("snd");
			int thd = Integer.parseInt(nums[1]);
			if( !(1<= thd && thd <= 1000) )
				throw new RuntimeException("thd");

			int len = lines[2].length();
			if( !(1<= len && len <= 100) )
				throw new RuntimeException("msg");

			result = fst + snd + thd;
			msg = lines[2];
		}catch(Exception e){
			System.out.println(e);
		}

		System.out.println(result + " " + msg);
	}
}
