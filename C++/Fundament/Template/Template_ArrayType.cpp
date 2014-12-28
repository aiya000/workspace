#include <iostream>
#include <vector>
#include <string>

//std::vector<std::string[]> func(){
//	std::vector<std::string[]> str;
//	std::string a[2];
//	a[0] = "a";
//	a[1] = "b";
//	str.push_back(a);
//	return str;
//}
std::vector<std::string*> func(){
	std::vector<std::string*> str;
	std::string a[2];
	a[0] = "a";
	a[1] = "b";
	str.push_back(a);
	return str;
}
auto main() -> int {
};
