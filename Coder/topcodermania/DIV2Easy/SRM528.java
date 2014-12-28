
public class SRM528 {
	public static void main(String[] args){
		System.out.println(
				new SRM528().start(2, 4, "xo?o??x?xox")
				);
	}

	public int start(int xcost, int ocost, String code){
		final char CHAEP    = xcost <= ocost? 'x' : 'o';
		final char HIGH     = xcost >  ocost? 'x' : 'o';
		final int  LOW_COST = xcost <= ocost? xcost : ocost;
		int totalCost = 0;

		String[] symCode = this.getSymmetrics(code);
		for(int i=0; i<symCode[0].length(); i++){
			if(symCode[0].charAt(i) == '?'){
				if(symCode[1].charAt(i) == '?'){
					symCode[0] = this.replaceByIndex(symCode[0], i, CHAEP);
					symCode[1] = this.replaceByIndex(symCode[1], i, CHAEP);
					totalCost += LOW_COST;
				}else{
					symCode[0] = this.replaceByIndex(symCode[0], i, symCode[1].charAt(i));
					if(symCode[1].charAt(i) == 'x')
						totalCost += xcost;
					else
						totalCost += ocost;
				}
			}else{
				if(symCode[1].charAt(i) == '?'){
					symCode[1] = this.replaceByIndex(symCode[1], i, symCode[0].charAt(i));
					if(symCode[0].charAt(i) == 'x')
						totalCost += xcost;
					else
						totalCost += ocost;
				}
			}
		}

		if(!symCode[0].equals(symCode[1]))
			return -1;
		else
			return totalCost;
	}

	public String[] getSymmetrics(String code){
		String[] ret = new String[2];
		int split;
		if(code.length()%2 == 0){
			split = code.length()/2;
			ret[0] = code.substring(0, split);
			ret[1] = code.substring(split);
		}else{
			split = (code.length()-1)/2;
			ret[0] = code.substring(0, split);
			ret[1] = code.substring(split+1);
		}
		char[] rev = ret[1].toCharArray();
		char[] reverse = new char[rev.length];
		for(int i=0; i<rev.length; i++)
			reverse[i] = rev[rev.length-1-i];
		ret[1] = new String(reverse);
		return ret;
	}
	public String replaceByIndex(String str, int idx, char c){
		char[] nc = str.toCharArray();
		nc[idx] = c;
		return new String(nc);
	}
}
