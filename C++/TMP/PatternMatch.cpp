#include <iostream>

template <class T>
struct Funny {
	void print(){
		std::cout << "undefined class type" << std::endl;
	}
};
template <>
struct Funny<int> {
	void print(){
		std::cout << "int type" << std::endl;
	}
};


int main(){
	Funny<char>().print();
	Funny<int>().print();
}
