#include <iostream>

template <int N>
struct recursive {
	void rec(){
		std::cout << N << " ";
		recursive<N-1>().rec();
	}
};

template <>
struct recursive<0> {
	void rec(){ std::cout << "end" << std::endl; }
};

/*-----*/

template <int N> struct fibonacci {
	const static int value = fibonacci<N-1>::value + fibonacci<N-2>::value;
};

template <> struct fibonacci<0> {
	const static int value = 0;
};
template <> struct fibonacci<1> {
	const static int value = 1;
};

int omake(int n){
	if(n == 0){ return 0; }
	else if(n == 1){ return 1; }
	return omake(n-1) + omake(n-2);
}

/*-----*/

auto main() -> int {
	recursive<5>().rec();
	std::cout << "TMP " << fibonacci<6>::value << std::endl;
	std::cout << "Normally " << omake(6) << std::endl;
}
