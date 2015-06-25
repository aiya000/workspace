/*
 * 2014-12-16
 * あ…あれ？ C#の分散、Javaの境界線と比べてわかりにくい…と思ったけれど、これ意外とすごいんじゃ。
 */

using System;


class A {}
class B : A {}
interface C<out T> {}
class D<T> : C<T> {}
public class Test {
	public static void Main(string[] args){
		C<A> a = new D<B>();
	}
}

