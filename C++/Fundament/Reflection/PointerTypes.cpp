#include <iostream>
#include <typeinfo>

auto main() -> int {
	int a[] = {1,2,3,4,5};
	int *b = a;
	std::cout << a << std::endl
			  << b << std::endl
			  << "a == b;  // " << (a == b) << std::endl
			  << "sizeof(a) == sizeof(b);  // " << (sizeof(a) == sizeof(b)) << std::endl
			  << "typeid(a) == typeid(b);  // " << (typeid(a) == typeid(b)) << std::endl;
};
