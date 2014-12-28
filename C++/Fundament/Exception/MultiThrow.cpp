#include <iostream>

void func(bool f) throw(int, char){
	if(f){
		throw -1;
	}else{
		throw 'e';
	}
}
auto main() -> int {
	try{
		func(false);
	}catch(int e){
		std::cout << e << std::endl;
	}catch(char e){
		std::cout << e << std::endl;
	}
};
