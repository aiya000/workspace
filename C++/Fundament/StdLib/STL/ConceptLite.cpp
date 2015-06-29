// 2015-06-29 : I couldn't still run this.

#include <iostream>
#include <type_traits>

template <typename T>
constexpr bool IntegralType() {
	return std::is_integral<T>::value;
}

template <typename T> requires IntegralType<T>()
void f(T a) {
	std::cout << a << std::endl;
}

int main() {
	f(10);
}
