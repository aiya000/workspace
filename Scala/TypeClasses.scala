trait Monoid[A] {
    def mappend(x: A, y: A): A
    def mempty: A
}

object TypeClasses {
    implicit object IntMonoid extends Monoid[Int] {
        def mappend(x: Int, y: Int) = x + y
        def mempty = 0
    }

    def sum[A](xs: List[A])(implicit m: Monoid[A]): A = xs.foldLeft(m.mempty)(m.mappend)

    def main(args: Array[String]): Unit = {
        val x = List(1, 2, 3, 4, 5).sum
        println(x)
    }
}
