sealed abstract class Tree
case class Node(x: Int, left: Tree, right: Tree) extends Tree
case object Leaf extends Tree

object Tree2 {
	val tree: Tree = Node(1
		, Node(2, Leaf, Leaf)
		, Node(3, Leaf, Leaf)
		)

	def main(args: Array[String]): Unit = {
	}
}

object TreeFunc {
	def sort(tree: Tree): Tree = throw new RuntimeException

	def append(x: Tree, y: Tree): Tree = x match {
		case Leaf => y match {
			case Leaf => Leaf
			case Node(yv, yl, yr) => Node(yv, Leaf, append(yl, yr))
		}
		case Node(xv, xl, xr) => y match {
			case Leaf => Node(xv, append(xl, xr), Leaf)
			case Node(_, _, _) => Node(xv, append(xl, xr), y)
		}
	}

	def filter(tree: Tree)(p: Int => Boolean): Tree = tree match {
		case Leaf => Leaf
		case Node(x, l, r) =>
			if (p(x)) {
				val left  = filter(l)(p)
				val right = filter(r)(p)
				Node(x, left, right)
			} else {
				val left  = filter(l)(p)
				val right = filter(r)(p)
				append(left, right)
			}
	}
}
