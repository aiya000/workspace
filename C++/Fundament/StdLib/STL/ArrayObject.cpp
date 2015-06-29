#include <iostream>
#include <tr1/array>

template <typename T,int n>
void func(std::tr1::array<T,n> array){
	for(T a : array)
		std::cout << a << ' ';
	std::cout << std::endl;
}
void func0(std::tr1::array<int,5> array){
	for(int a : array)
		std::cout << a << ' ';
	std::cout << std::endl;
}

auto main() -> int {
	std::tr1::array<int,5> array = {{1,2,3,4,5}};
	func<int,5>(array);
	func0(array);

	array[0] = 10;
	func0(array);
}

