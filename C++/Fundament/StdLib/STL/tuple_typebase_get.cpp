#include <iostream>
#include <tuple>


int main() {
	auto t = std::tuple<int,std::string>(10, "foo");
	//auto x = std::get<0>(t);
	auto x = std::get<int>(t);
	std::cout << x << std::endl;
}
