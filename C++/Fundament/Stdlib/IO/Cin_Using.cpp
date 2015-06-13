#include <iostream>

template <typename T>
T getInput(){
	T input;
	std::cout << "Please Input" << std::endl;
	std::cin >> input;
	if(!std::cin.good()){
		std::cin.clear();
		std::cin.seekg(0);
		std::cout << "int期待でstring入力したりした？" << std::endl;
	}
	return input;
}

auto main(){
	int input = getInput<int>();
	std::cout << input << std::endl;
}
