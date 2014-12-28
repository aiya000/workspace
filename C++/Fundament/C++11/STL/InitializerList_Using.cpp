#include <iostream>
#include <initializer_list>

class Test {
private:
	int array[3];
	
public:
	Test(std::initializer_list<int> list){
		int i = 0;
		for(auto it=list.begin(); it!=list.begin()+3; it++)
			array[i++] = *it;
	}

	void show(){
		for(int view : array)
			std::cout << view << " ";
		std::cout << std::endl;
	}
};

class Test0 {
public:
	Test0(std::initializer_list<int> list, int i, char j){
		std::cout << "list: ";
		for(int view : list)
			std::cout << view << " ";
		std::cout << std::endl;
		std::cout << "i: " << i << std::endl;
		std::cout << "j: " << j << std::endl;
	}
};

auto main() -> int {
	Test ins({1,2,3});
	Test ins0 = {4,5,6};
	Test ins1{7,8,9};
	ins.show();
	ins0.show();
	ins1.show();
	std::cout << std::endl;

	Test0 ins2({1,2,3,4,5}, 6, '7');
	std::cout << std::endl;

	std::initializer_list<int> iniList = {1,2,3,4,5};
	for(int view : iniList)
		std::cout << view << " ";
	std::cout << std::endl;
}
