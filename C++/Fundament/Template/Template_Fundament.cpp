#include <iostream>
#include <typeinfo>

// default argment
template <typename T = int>
struct Print {
	static void typePrint(){
		std::cout << typeid(T).name() << std::endl;
	}
};

auto main() -> int {
	Print<int>::typePrint();
	Print<>::typePrint();
}
