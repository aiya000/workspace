// https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/-pair/

class NamedTuple<A,B>(val first: A, val second: B) {
	operator fun component1() = this.first
	operator fun component2() = this.second
	override fun toString() = "NamedTuple(first=" + this.first + ", second=" + this.second + ")"
}

fun main(args: Array<String>) {
	val x      = Pair(1, 2)
	val (y, z) = x
	println(x)
	println(y)
	println(z)

	val x1 = NamedTuple(1, 2)
	val (y1, z1) = x1
	println(x1)
	println(y1)
	println(z1)
}
