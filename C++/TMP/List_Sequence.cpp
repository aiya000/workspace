#include <iostream>

template <class First, class Rest>
struct Cons {
	typedef First first;
	typedef Rest  rest;
};
struct ConsNil {};

template <class T1, class T2, class T3, class T4>
struct TypeList {
	typedef Cons<T1, Cons<T2, Cons<T3, Cons<T4, ConsNil> > > > type;
};


template <class CONS>
struct for_each {
	template <class FUNC>
	static void apply(const FUNC& f){
		typename CONS::first v;
		f(v);
		for_each<typename CONS::rest>::apply(f);
	}
};

template <>
struct for_each<ConsNil> {
	template <class FUNC>
	static void apply(const FUNC&){}
};


/*-----*/

struct A { std::string name() const { return "A"; } };
struct B { std::string name() const { return "B"; } };
struct C { std::string name() const { return "C"; } };
struct D { std::string name() const { return "D"; } };

struct Printer { template<class T> void operator()(const T& v) const {
	std::cout << v.name() << std::endl;
}};
auto main() -> int {
	for_each< TypeList<A,B,C,D>::type >::apply( Printer() );
}
