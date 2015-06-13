#include <iostream>
#include <string>

// Rvalueは参照できない
void ref(std::string &str){
	std::cout << str << std::endl;
}
// Rvalue用のオーバーロードを作って適用
void ref(std::string &&str){
	std::cout << "is rvalue" << " ";
	ref(str);
}

auto main() -> int {
	ref("a");
}
