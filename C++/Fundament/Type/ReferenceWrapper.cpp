#include <iostream>
#include <functional>

int main() {
	int n = 10;
	std::reference_wrapper<int> refN(n);
	refN.get() = 20;
	std::cout << n << std::endl;

	std::reference_wrapper<int> refM = std::ref(n);
	refM.get() = 30;
	std::cout << n << std::endl;

	// std::ref(T&) cannot copy mutable
	//std::reference_wrapper<const int> refL = std::ref(n);
	// std::cref(const T&) can copy mutable as immutable
	std::reference_wrapper<const int> refL = std::cref(n);
	//refL.get() = 200;
}
