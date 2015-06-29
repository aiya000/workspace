#include <iostream>
#include <functional>


int f() { return 10; }
int g(int x) { return x; }
int h(int x, int y) { return x + y; }

int main() {
	auto f0 = std::bind(f);
	std::cout << f0() << std::endl;

	auto g0 = std::bind(g, f0());
	std::cout << g0() << std::endl;

	// curry
	auto h0 = std::bind(h, f0(), std::placeholders::_1);
	auto h1 = std::bind(h0, 20);
	std::cout << h1() << std::endl;
}
