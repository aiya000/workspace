data class Sum(val unSum: Int)
operator fun Sum.plus(x: Sum) = Sum(this.unSum + x.unSum)

data class Product(val unProduct: Int) {
	operator fun times(x: Product) = Product(this.unProduct * x.unProduct)
}

fun main(args: Array<String>) {
	val x = Sum(10) + Sum(20)
	println(x)

	val y = Product(10) * Product(20)
	println(y)
}

/*
compareTo
contains
dec
div
divAssign
equals
get
inc
invoke
minus
minusAssign
modAssign
not
plus
plusAssign
rangeTo
rem
set
times
timesAssign
unaryMinus
unaryPlus
*/
