import java.util.List;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.Set;
import java.util.Map;

import java.util.stream.Stream;
import java.util.stream.Collectors;

import java.util.function.Function;

/** @see http://www.ne.jp/asahi/hishidama/home/tech/java/collector.html **/
public class Collectors_Using {
	public static void main(String[] args){
		/* ** Basics ** */ //{{{
		List<Integer> list =
			Stream.iterate(1, n -> n+1).limit(5)
				.collect(
					Collectors.toList());
		System.out.println(list);

		Queue<Integer> queue =
			Stream.iterate(1, n -> (n+1)*(n+1)).limit(5)
				.collect(
					Collectors.toCollection(
						LinkedBlockingQueue::new));
		System.out.println(queue);

		Set<String> set =
			Stream.of("a", "b", "c")
				.collect(
					Collectors.toSet());
		System.out.println(set);
		//}}}
		/* ** Applicative ** */ //{{{
		Map<Boolean, List<Character>> map =
			Stream.of('A', 'a', 'B', 'b').collect(
				Collectors.partitioningBy(
					c -> Character.isUpperCase(c) ));
		System.out.println(map);
		//}}}
	}
}
