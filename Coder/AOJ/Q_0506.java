import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Q_0506 {
	public static void main(String[] args){
		StringBuilder result = new StringBuilder();
		try{
			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			while(true){
				String count = in.readLine();
				if( count.equals("0") || Integer.parseInt(count) > 20 )  break;
				String numCode = in.readLine();
				if( numCode.length() > 100 )  break;

				for(int i=0; i<Integer.parseInt(count); i++)
					numCode = zip(numCode);
				result.append(numCode + "\n");
			}
		}catch(IOException e){
			e.printStackTrace();
		}
		System.out.println(result);
	}

	static String zip(String numCode){
		if(numCode.length() == 0)
			return "";

		char top = numCode.charAt(0);
		String underCode = numCode.substring(1);
		
		int i;
		for(i=0; i<underCode.length(); i++){
			if(top != underCode.charAt(i))
				break;
		}

		return (i+1) + String.valueOf(top) +
			zip(underCode.substring(i));
	}
}
