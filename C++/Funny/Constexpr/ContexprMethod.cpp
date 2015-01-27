#include <iostream>
void go();
void go(int);
void go(int,int);
auto main() -> int { go(); }

/*---------------------------*/

constexpr int hoge(){ return 10; }

auto go() -> void {
	int a = hoge();
	int b[a];
	std::cout << b << std::endl;
	go(0);
}

/*---------------------------*/

template <typename T, size_t N>
struct ConstEx {
	T array[N];
	constexpr size_t size() const { return N; }
};

auto go(int) -> void {
	ConstEx<int, 5> immutable;
	std::cout << immutable.size() << std::endl;

	//int i = 10;
	//ConstEx<char, i> mutable0;
	//std::cout << mutable0.size() << std::endl;
	go(0,1);
}

/*---------------------------*/

struct A {
	int a;
	//constexpr int hoge(){
	//	a = 10;
	//	return 10;
	//}
	int hoge() {
		a = 10;
		return 10;
	}
};

auto go(int,int) -> void {
	A a;
	std::cout << static_cast<void*>(&a) << std::endl;  // キャストに意味はない、したかっただけ。
}
