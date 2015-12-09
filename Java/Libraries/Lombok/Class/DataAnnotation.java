// example
// $ java -jar lombok.jar delombok -d Foo.java Data.java

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.AccessLevel;

// The class was generated #equals(), #canEquals(), #hashCode()
// and #toString()
@Data
public class DataAnnotation {
	// final field was added to constructor arguments and getter
	private final String name;
	// normal field was generated its accessor
	public  int foo;
	private int bar;
	// this field's setter was generated by protected
	@Setter(AccessLevel.PROTECTED)
	private double baz = 10.0;
}
