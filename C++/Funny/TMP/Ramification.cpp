#include <iostream>
#include <typeinfo>

template <bool cond>
struct ram;

template <>
struct ram<true> {
	void action(){ std::cout << "true" << std::endl; }
};

template <>
struct ram<false> {
	void action(){ std::cout << "false" << std::endl; }
};


template <int N> struct recurser {
	void rec(){
		ram<N%2==0>().action();
		recurser<N-1>().rec();
	}
};

template <> struct recurser<0> {
	void rec(){}
};

/*-----*/

template <bool b, typename T1, typename T2>
struct if_;

template <typename T1, typename T2> struct if_<true, T1, T2> {
	typedef T1 type;
};
template <typename T1, typename T2> struct if_<false, T1, T2> {
	typedef T2 type;
};

/*-----*/

auto main() -> int {
	recurser<5>().rec();
	std::cout << typeid( if_<true, char, int>::type ).name() << std::endl;
}
