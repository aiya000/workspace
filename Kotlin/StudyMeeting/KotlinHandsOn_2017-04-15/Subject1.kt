//FIXME: this cannot be compiled

fun main(args: Array<String>) {
	for (i in 1..100) {
		val x = Pair(i % 3, i % 5)
		val result = when (x) {
			is #(0, 0) -> "FizzBuzz"
			is #(0, *) -> "Fizz"
			is #(*, 0) -> "Buzz"
			else       -> i.toString()
		}
		println(result)
	}
}
