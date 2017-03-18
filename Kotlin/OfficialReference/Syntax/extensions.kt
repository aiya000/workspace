data class Sum(val unSum: Int) {
	companion object {}
}
fun Sum.succ() = this * Sum(1)
operator fun Sum.times(x: Sum) = Sum(this.unSum + x.unSum)
val Sum.pred: Sum get() = this * Sum(-1)
val Sum.Companion.empty: Sum get() = Sum(0)

fun main(args: Array<String>) {
	val x = Sum.empty * Sum(1).succ() * Sum(4).pred
	println(x)
}
