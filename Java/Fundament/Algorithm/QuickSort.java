import java.util.ArrayList;

public class QuickSort {
	public static void main(String[] args){
		int[] array = { 3,5,7,9,1,4,6,8,0,2 };
		array = qsort(array);
		for(int i : array)
			System.out.print(i + ",");
		System.out.println();
	}

	static int[] filterS(int x, int[] array){
		ArrayList<Integer> smallList = new ArrayList<>();
		for(int i : array)
			if(i < x)
				smallList.add(i);
		int[] ret = new int[smallList.size()];
		for(int i=0; i<ret.length; i++)
			ret[i] = smallList.get(i);
		return ret;
	}
	static int[] filterL(int x, int[] array){
		ArrayList<Integer> largeList = new ArrayList<>();
		for(int i : array)
			if(x < i)
				largeList.add(i);
		int[] ret = new int[largeList.size()];
		for(int i=0; i<ret.length; i++)
			ret[i] = largeList.get(i);
		return ret;
	}

	static int[] qsort(int[] array){
		if(array.length <= 1)
			return array;

		int x = array[0];
		int[] xs = new int[array.length - 1];
		System.arraycopy(array, 1, xs, 0, array.length-1);

		ArrayList<Integer> result = new ArrayList<>();
		int[] s = qsort(filterS(x, xs));
		for(int i : s)  result.add(i);
		result.add(x);
		int[] l = qsort(filterL(x, xs));
		for(int i : l)  result.add(i);
		int[] ret = new int[result.size()];
		for(int i=0; i<ret.length; i++)  ret[i] = result.get(i);
		return ret;
	}
}
