#include <iostream>
#include <memory>

struct A {
	int x;
	int y;
	int z;
	A(int x, int y, int z) : x(x), y(y), z(z) {}
};

int main() {
	// safety make
	std::unique_ptr<int> p = std::make_unique<int>(10);
	std::cout << *p << std::endl;

	// array
	constexpr auto size = 5;
	auto ps = std::make_unique<int[]>(size);
	for (int i = 0; i < size; i++) {
		std::cout << ps[i] << " ";
	}
	std::cout << std::endl;

	// std::array
	auto qs = std::make_unique<std::array<int,size>>();
	for (int i = 0; i < size; ++i) {
		std::cout << (*qs)[i] << " ";
	}
	std::cout << std::endl;

	// call constructor
	auto q = std::make_unique<A>(1, 2, 3);
	std::cout << q->x << " " << q->y << " " << q->z << std::endl;
}
