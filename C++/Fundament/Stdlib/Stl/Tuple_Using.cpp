#include <iostream>
#include <tuple>

std::tuple<char, char, int> getTuple(){
	return std::make_tuple('a', 'b', 30);
}

auto main() -> int {
	std::tuple<int, char, std::string> tuple = std::make_tuple(10, 'b', "30");
	auto tuple0 = getTuple();
	std::cout << "Tuple1: " << std::get<0>(tuple)
		      << ", "       << std::get<1>(tuple)
			  << ", "       << std::get<2>(tuple)  << std::endl
			  << "TUple2: " << std::get<0>(tuple0)
			  << ", "       << std::get<1>(tuple0)
			  << ", "       << std::get<2>(tuple0) << std::endl;
	//std::cout << "OutOfBounds: " << std::get<3>(tuple) << std::endl;  // コンパイル時エラー
}
