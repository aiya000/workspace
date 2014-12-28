
/*
 * Language : Java7
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;


public class _1021 {
	public static void main(String[] args){
		StringBuilder sb = new StringBuilder();
		try(BufferedReader in = new BufferedReader(new InputStreamReader(System.in))){
			String s = null;
			while( !(s = in.readLine()).startsWith("42") ){
				sb.append(s + "\n");
			}
		}catch(IOException e){
			e.printStackTrace();
		}
		char[][] dimension = toDimension(sb.toString());
		System.out.println(
				isSamisikunai(dimension) ? "yes" : "no");
	}


	/*
	 *        NNNNN
	 * OOO    NOOON
	 * OOO => NOOON
	 * XXX    NXXXN
	 *        NNNNN
	 */
	private static char[][] toDimension(String str){ /*{{{*/
		String[] a = str.split("\n");
		char[][] dim = new char[a.length+2][a[0].toCharArray().length+2];

		for(int f=0; f<dim[0].length; f++){
			dim[0][f] = 'N';
		}

		int i;
		for(i=0; i<a.length; i++){
			dim[i+1][0] = 'N';
			int j;
			for(j=1; j<=a[i].length(); j++){
				dim[i+1][j] = a[i].charAt(j-1);
			}
			dim[i+1][j] = 'N';
		}
		for(int f=0; f<dim[0].length; f++){
			dim[i+1][f] = 'N';
		}

		return dim;
	} /*}}}*/

	private static boolean isSamisikunai(char[][] dim){
		for(int i=0; i<dim.length; i++) for(int j=0; j<dim[i].length; j++) if(dim[i][j] == 'O'){
			if(dim[i][j+1] == 'O'){
				dim[i][j+1] = dim[i][j] = 'N';
				continue;
			}else if(dim[i+1][j] == 'O'){
				dim[i+1][j] = dim[i][j] = 'N';
				continue;
			}else if(dim[i][j-1] == 'O'){
				dim[i][j-1] = dim[i][j] = 'N';
				continue;
			}else if(dim[i-1][j] == 'O'){
				dim[i-1][j] = dim[i][j] = 'N';
				continue;
			}
		}

		return isAllN(dim);
	}

	private static boolean isAllN(char[][] dim){ /*{{{*/
		for(char[] r : dim) for(char c : r)
			if(c == 'O')
				return false;
		return true;
	} /*}}}*/

}
