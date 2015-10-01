#include <iostream>
#include <functional>

int main() {
	std::function<void()> f = [] () {
		std::cout << "f()" << std::endl;
	};
	std::function<int(int)> g = [] (int x) {
		return x * x;
	};
	std::function<int(int,int)> h = [] (int x, int y) {
		return x * y;
	};

	f();
	std::cout << g(10)
	          << ','
	          << h(g(10), g(10))
	          << std::endl;

	// ill-formed in C++14 or earlier
	//std::function<void()> k = [] () { return 10; };
}
