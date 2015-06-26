#include <iostream>
#include <memory>

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
}
