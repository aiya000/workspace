#include <iostream>
#include <string>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wwrite-strings"
auto main() -> int {
	char* cstr = "aaa";
	std::string cppstr = cstr;
	std::cout << cppstr << std::endl;
};
#pragma GCC diagnostic pop
