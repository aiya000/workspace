#include <iostream>
#include <cxxabi.h>

template <typename... Ts>
void f(Ts... args) {}

template <typename T, typename... Ts>
struct head {
	using type = T;
};

template <typename... Ts>
struct g {
	using type = typename head<Ts...>::type;
};

template <typename... Ts>
struct k {
	using type = g< g<Ts>... >;
};

int main() {
	auto demangleIt = [](auto o){
		return abi::__cxa_demangle(typeid(o).name(), 0, 0, nullptr);
	};

	f(10, 20.0, 'a');

	g<int,double,char>::type a;
	std::cout << demangleIt(a) << std::endl;
}
