#include <iostream>
#include <typeinfo>
#include <cxxabi.h>

auto main() -> int {
	const std::type_info& type = typeid(10);
	std::string mangledName = type.name();
	//int status;
	//std::string demangledName = abi::__cxa_demangle(type.name(), 0, 0, &status);
	std::string demangledName = abi::__cxa_demangle(type.name(), 0, 0, nullptr);  // are you OK ?

	std::cout << mangledName   << std::endl;
	std::cout << demangledName << std::endl;
};
