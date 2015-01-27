#include <iostream>

template <class F>
struct higher { static void applyer(){
	F::action();
}};


struct funcA { static void action(){
	std::cout << "Action A" << std::endl;
}};

struct funcB { static void action(){
	std::cout << "Action B" << std::endl;
}};

/*-----*/

template <class F, class X>
struct applyer { static int value(const X& x){
	return F::apply(x);
}};

struct div2 { static int apply(int x){
	return x/2;
}};
struct multipl2 { static int apply(int x){
	return x*2;
}};

/*-----*/

auto main() -> int {
	higher<funcA>::applyer();
	higher<funcB>::applyer();

	std::cout << applyer<div2, int>::value(8) << std::endl;
	std::cout << applyer<multipl2, int>::value(8) << std::endl;
}
