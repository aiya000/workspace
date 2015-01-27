#include <iostream>
#include <vector>
#include <string>

int main(){
	std::vector<int> v{1};
	v.erase(v.begin());
	std::cout << "v.size():" << v.size() << std::endl
	          << "v[0]:"     << v[0]     << std::endl;

	v.push_back(2);
	std::cout << "v.size():" << v.size() << std::endl
	          << "v[0]:"     << v[0]     << std::endl;

	std::cout << std::endl;

	std::vector<std::string> vv{"a"};
	vv.erase(vv.begin());
	std::cout << "vv.size():" << vv.size() << std::endl
	          << "vv[0]:"     << vv[0]     << std::endl;
	vv.push_back("b");
	std::cout << "vv.size():" << vv.size() << std::endl
	          << "vv[0]:"     << vv[0]     << std::endl;

	std::cout << "まさかず氏いわく「多分未定義動作」" << std::endl;
}
