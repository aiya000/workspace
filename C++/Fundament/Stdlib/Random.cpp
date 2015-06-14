#include <iostream>
#include <random>

int main() {
	std::random_device rand;
	std::cout << rand() << std::endl;
	std::cout << rand() << std::endl;
}
