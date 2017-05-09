fun Int.succ() = this + 1

fun main(args: Array<String>) {
	val x: Int? = 10
	val y: Int? = null
	// this 'if' needs 'else' expression
	val z = if (x != null && y != null) x * y else null
	println(z)

	println(x?.succ())
	println(y?.succ())

	// Elvis operator
	println(y ?: 20)
	println(y ?: throw Exception("aho"))
}
