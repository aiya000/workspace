import java.util.Arrays;

import java.util.List;
import java.util.ArrayList;

public class PECS_A_Use {
	public static void main(String[] args){
		new PECS_A_Use().main();
	}


	class HasList {
		private List<Object> list = new ArrayList<>();

		// Producer => fromList
		public void copyFromList(List<? extends Object> fromList){
			list.clear();
			for(Object i : fromList)  list.add(i);
		}

		// Consumer => toList
		public void copyToList(List<? super Object> toList){
			for(Object o : toList)  toList.add(o);
		}

		@Override
		public String toString(){ return list.toString(); }
	}

	private void main(){
		HasList hasList = new HasList();
		List<Object> list = Arrays.asList(1,2,3,4,5);

		hasList.copyFromList(list);
		System.out.println(hasList);

		hasList.copyToList(list);
		System.out.println(list);
	}
}
