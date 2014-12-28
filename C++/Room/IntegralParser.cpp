#include <iostream>
#include <string>
#include <vector>

std::vector<int> parse(int recent, std::string enu);

int main(){
	std::string enuStep1 = "1 10 120 1";
	std::string enuStep2 = "1 10 120 1 -1 -20 +10";
	
	std::vector<int> v = parse(0, enuStep1);
	for(auto i : v)
		std::cout << i << ' ';
	std::cout << std::endl;
}

template <class T>
std::vector<T> cons(std::vector<T> a, std::vector<T> b){
	std::vector<T> v;
	for(auto c : a)  v.push_back(c);
	for(auto c : b)  v.push_back(c);
	return v;
}
std::vector<int> parse(int recent, std::string enu){
	if(
}
