#include <iostream>


int main() {
	auto x     = 10;
	auto twice = [y = x + x](){ return y; };
	std::cout << twice() << std::endl;

	auto y = 20;
	auto f = [a = x, &b = y](){ return b = a; };
	f();
	std::cout << x << "," << y << std::endl;
}
