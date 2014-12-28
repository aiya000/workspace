import java.util.Optional;
import java.util.NoSuchElementException;

import java.util.Arrays;

/**
 * @author aiya_000
 * @since  2014/05/26
 * @see    http://d.hatena.ne.jp/nowokay/20130524
 * @see    http://d.hatena.ne.jp/nowokay/20130805
 */

public class Optional_Using {
	public static void main(String[] args){
		Optional_Using optional = new Optional_Using();
		optional.methods();
		optional.likeMonad();
		optional.trueMonad();
	}

	private void methods(){ /*{{{*/
		// Create Optional Value
		Optional<String> opt0 = Optional.of("ahoge");
		System.out.println(opt0);
		System.out.println(opt0.get());
		System.out.println();

		// Create Optional Empty Value
		Optional<String> opt1 = Optional.empty();
		System.out.println(opt1);
		try{
			System.out.println(opt1.get());
		}catch(NoSuchElementException e){
			System.out.println(
					"catch Exception:\n  " +
					e.getMessage());
		}
		System.out.println();

		// Is Empty ?
		if( opt1.isPresent() ){
			System.out.println("opt1.get() : " + opt1.get());
		}
		// If Empty Then Action
		opt0.ifPresent(s -> {
			System.out.println("opt0.get() : " + s);
		});
		System.out.println(
				"Optional#orElse(T) : " +
				opt1.orElse("Empty") );

		// Lazy Evaluation ?
		System.out.println(
				opt1.orElseGet(() -> new String("A Heavy Object")));

		// Throw Exception
		try{
			System.out.println(
					opt1.orElseThrow(
						() -> new Exception("Optional#orElseThrow(Supplier)")));
		}catch(Exception e){
			System.out.println(e);
		}
	} /*}}}*/
	private void likeMonad(){ /*{{{*/
		// モナドライク…Maybeライク？
		Optional<String> a = Optional.of("a");
		Optional<String> b = Optional.of("b");
		Optional<String> go0 =
			a.isPresent() ? b.isPresent()
			              ? Optional.of(String.join(" ", a.get(), b.get()))
			              : Optional.empty()
			              : Optional.empty();
		go0.ifPresent(s -> System.out.println(s));
	} /*}}}*/
	private void trueMonad(){ /*{{{*/
		/* added in Java SE 8 b1 01 */
		String prime = "ahoge";
		Optional.ofNullable(prime)
			.map(s -> s + " mogUmogU.")
			.filter(s -> s.length() > 5)
			.ifPresent(s -> System.out.println("s: " + s));

		// Optional List Stream
		Arrays.asList(1,2,3,4,5).stream()
			.forEach(x -> Optional.ofNullable(x)
					.map(x0 -> x0 * 10)
					.filter(x1 -> x1 >= 30)
					.ifPresent(x2 -> System.out.println(x2)));
	} /*}}}*/

}
