import java.util.Arrays;
import java.util.List;

import java.util.stream.Stream;
import java.util.stream.IntStream;
import java.util.stream.DoubleStream;

import java.io.BufferedReader;
import java.io.StringReader;

import java.util.regex.Pattern;

import java.util.stream.Collectors;

import java.util.Random;

//import java.util.function.Consumer;       // => (T a) -> void
//import java.util.function.Supplier;       // => ()    -> T a
//import java.util.function.UnaryOperator;  // => (T a) -> T b


public class StreamAPI {
	public static void main(String[] args){
		StreamAPI streamAPI = new StreamAPI();
		streamAPI.creates();
		streamAPI.basics();
		streamAPI.funnies();
		streamAPI.vivids();
		streamAPI.stables();
		streamAPI.sugoi();
	}

	private void creates(){ /*{{{*/
		/* List to Stream */
		List<Integer> list0 = Arrays.asList(1,2,3,4,5);
		Stream<Integer> stream0 = list0.stream();
		stream0.forEach(n -> System.out.print(n + " "));
		System.out.println();


		/* Array to Stream */

		// Primitive Stream
		int[] array0 = {1,2,3,4,5};
		System.out.println(
				Arrays.stream(array0).getClass().getName()
				);
		//Stream<Integer> stream1 = Arrays.stream(array0);
		IntStream stream1 = Arrays.stream(array0);
		stream1.forEach(n -> System.out.print(n + " "));
		System.out.println();

		// Object Stream
		class Hoge {};
		Hoge[] array1 = {new Hoge()};
		Stream<Hoge> stream2 = Arrays.stream(array1);
		stream2.forEach(o -> System.out.println(o));
		System.out.println();

		String[] array2 = {"a", "b", "c", "d", "e"};
		Stream<String> stream3 = Arrays.stream(array2, 2, 4);
		stream3.forEach(s -> System.out.print(s + " "));
		System.out.println();

		/* Simple Generate Stream */
		Stream<String> stream4 = Stream.of("a","b","c","d","e");
		stream4.forEach(s -> System.out.print(s + " "));
		System.out.println();

		String[] array3 = {"a","b","c","d","e"};
		Stream<String> stream5 = Stream.of(array3);
		stream5.forEach(s -> System.out.print(s + " "));
		System.out.println();

		double[] array4 = {1,2,3,4,5};
		DoubleStream stream6 = DoubleStream.of(array4);
		stream6.forEach(n -> System.out.print(n + " "));
		System.out.println();

		double[] array5 = {1,2,3,4,5};
		try{
			DoubleStream stream7 = Arrays.stream(array5, 4, 6);
			stream7.forEach(n -> System.out.print(n + " "));
			System.out.println();
		}catch(ArrayIndexOutOfBoundsException e){
			System.out.println("あふれた。");
		}
	}/*}}}*/
	private void basics(){ /*{{{*/
		/* Basic Methods */
		String[] array0 = {"1", "2", "3", "4", "5", "6"};
		Stream<String> stream0 = Arrays.stream(array0)
			.skip(2).limit(5);
		
		IntStream stream1 = "ahoge".chars();
		stream1.forEach(c -> System.out.print(c + " "));
		System.out.println();

		new BufferedReader(new StringReader("ahoge\nhogefoo\nahooo"))
			.lines()
			.forEach(s -> System.out.print(s + " "));
		System.out.println();

		Pattern.compile("\\w").splitAsStream("abc ahoge efg")
			.forEach(s -> System.out.print(s + " "));
		System.out.println();
	}/*}}}*/
	private void funnies(){ /*{{{*/
		Stream<Integer> estream = Stream.empty();
		System.out.println(estream);

		Stream<Integer> infStream = Stream.generate(() -> 1);  // Supplier<Integer>
		System.out.println(infStream);
		//infStream.forEach(System.out::println);
		infStream.limit(10).collect(Collectors.toList())  // List<Integer>
			.forEach(System.out::print);
		System.out.println();

		DoubleStream dInfStream = DoubleStream.generate(Math::random);
		dInfStream.limit(10).forEach(n -> System.out.print(n + " "));
		System.out.println();
	} /*}}}}*/
	private void vivids(){ /*{{{*/
		/* Vivid functions !!! */

		// Generating Area by step
		IntStream stream0 = IntStream.iterate(1, p -> p+2);
		for(int i : stream0.limit(10).toArray())
			System.out.print(i + " ");
		System.out.println();

		// Generating Area by range
		// double is nothing this function
		IntStream.range(1, 10).forEach(n -> System.out.print(n + " "));
		System.out.println();
		IntStream.rangeClosed(1, 10).forEach(n -> System.out.print(n + " "));
		System.out.println();


		// Random List
		IntStream stream1 = new Random().ints(10);
		stream1.forEach(n -> System.out.print(n + " "));
		System.out.println();
		// and range
		new Random().ints(10, 0, 10)
			// and ordering... mmm??
			.forEachOrdered(n -> System.out.print(n + " "));
		System.out.println();

	} /*}}}*/
	private void stables(){ /*{{{*/
		// concat | Primitives Supported
		Stream.concat(Stream.of("a", "b", "c"), Stream.of("d", "e", "f"))
			.forEach(s -> System.out.print(s + " "));
		System.out.println();


		// stable...?
		// Streams Builder !! | Primitives Supported
		Stream.Builder<String> stbuilder = Stream.builder();
		stbuilder.accept("a");
		stbuilder.add("b").add("c");
		stbuilder.build().forEach(s -> System.out.print(s + " "));
	} /*}}}*/
	private void sugoi(){ /*{{{*/

		// Iterator to Stream that control by StreamSupport class
		Iterable<String> it = Arrays.asList("q", "w", "e", "r", "t", "y");
		Spliterator<String> spliterator = it.spliterator();
		// Would be able to paralllel operation ?
		boolean parallelable = false;
		StreamSupport.stream(spliterator, parallelable)
			.forEach(s -> System.out.print(s + " "));

	} /*}}}*/
}
