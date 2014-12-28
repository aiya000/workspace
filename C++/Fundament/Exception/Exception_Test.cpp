#include <iostream>

void throwTest() throw(std::exception){
	throw std::exception();
}

auto main() -> int {
	try{
		throwTest();
	}catch(std::exception e){
	}
}
