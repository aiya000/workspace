#include <iostream>
#include <typeinfo>

template <class T>
struct getType;

template <class R> struct getType<R> {
	typedef R returnType;
} 
template <class R> struct getType<R> {
	typedef R returnType;
};

auto main() -> int {
	typedef getType<int>::returnType var;
	std::cout << typeid(var) << std::endl;
}
