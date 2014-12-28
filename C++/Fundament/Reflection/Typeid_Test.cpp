#include <iostream>
#include <sstream>
#include <typeinfo>

auto main() -> int {
	int a = 10;
	char b = '2';
	float c = 30.0;
	//const type_info info = typeid(a);
	std::cout << typeid(a).name() << std::endl;
	std::cout << typeid(b).name() << std::endl;
	std::cout << typeid(c).name() << std::endl;
}
