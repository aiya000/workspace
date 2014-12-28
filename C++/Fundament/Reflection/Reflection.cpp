#include <iostream>
#include <random>
#include <cxxabi.h>

auto main() -> int {
	std::random_device rand;
	std::cout << rand() << std::endl;
	std::cout << typeid(rand()).name() << std::endl;

	int status;
	std::cout << abi::__cxa_demangle(typeid(rand()).name(), 0, 0, &status) << std::endl;
};
