class IntPair(val first: Int, val second: Int) {
	fun sum()  = first + second
	fun max()  = if (first >= second) first else second
	fun swap() = IntPair(second, first)
}

fun Int.meet(x: Int) = IntPair(this, x)
