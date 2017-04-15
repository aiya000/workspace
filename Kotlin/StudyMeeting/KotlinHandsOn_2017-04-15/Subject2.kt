fun square(x: Int) = x * x
fun max(x: Int, y: Int) = if (x >= y) x else y
fun isEven(x: Int) = x % 2 == 0
fun factorial(x: Int): Int = when (x) {
	0    -> 1
	else -> x * factorial(x - 1)
}

fun main(args: Array<String>) {
	println(square(4))
	println(max(5,3))
	println(max(3,4))
	println(isEven(2))
	println(isEven(3))
	println(factorial(4))
}
