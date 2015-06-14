#include <iostream>
#include <type_traits>

int main() {
	auto a = std::is_same<int,int>::value;
	std::cout << a << std::endl;
}
