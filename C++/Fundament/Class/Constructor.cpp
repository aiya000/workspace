#include <iostream>
#include <string>

struct EqConstructor {
	std::string m_str;
	EqConstructor(const char* str) : m_str(str){}
};

struct EqConstructor0 {
	std::string m_str;
	explicit EqConstructor0(const char* str) : m_str(str){}
};

int main(){
	EqConstructor eqc = "10";
	std::cout << eqc.m_str << std::endl;

	//EqConstructor0 eqc0 = "20";
	EqConstructor0 eqc0("20");
	std::cout << eqc0.m_str << std::endl;
}
