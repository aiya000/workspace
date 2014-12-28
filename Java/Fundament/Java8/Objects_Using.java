import java.util.Objects;

public class Objects_Using {
	public static void main(String[] args){
		Object o0 = 10;
		String o1 = "Hello";
		String o2 = "hoge", o3 = "foo";

		/* ** Equals methods ** */ //{{{
		// same Object#equals()
		System.out.println( Objects.equals(o0, o1) );
		System.out.println( Objects.equals(null, null) );
		// Type's Level comparison => (===)
		System.out.println( Objects.deepEquals(o2, o3) );

		System.out.println("-----");//}}}
		/* ** Generates HashCode ** */ //{{{
		// same Object#hashCode()
		System.out.println( Objects.hashCode(o0) );
		System.out.println( Objects.hashCode(null) );
		// same Arrays.hashCode()
		System.out.println( Objects.hash(10) );
		System.out.println( Objects.hash(1,2,3,4,5) );

		System.out.println("-----");//}}}
		/* ** Convert to String ** */ //{{{
		// same String.valueOf()
		System.out.println( Objects.toString(null) );
		System.out.println( Objects.toString(o0) );
		System.out.println( Objects.toString(o1) );
		// Object#toString() with default value
		System.out.println( Objects.toString(null, "NULL") );
		System.out.println( Objects.toString(o0,   "NULL") );

		System.out.println("-----");//}}}
		/* ** Comparison methods ** */ 
		System.out.println(
				Objects.compare(10, 20,
					(n1, n2) -> (n1 - n2)) );
		//System.out.println(
		//		Objects.compare(o2, o3,
		//			(s1, s2) -> 
	}
}
