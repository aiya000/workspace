import lombok.Getter;


public class Lazy {
	@Getter(lazy=true)
	private final double[] array = { 1, 2, 3, 4, 5 };
}
