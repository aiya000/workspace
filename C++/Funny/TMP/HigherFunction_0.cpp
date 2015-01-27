#include <iostream>

template <class F, int N>
struct applyer {
	static const int value = F::template apply<N>::value;
};

struct multipl2 {
	template <int N> struct apply {
		static const int value = N*2;
	};
};

/*-----*/

auto main() -> int {
	std::cout << applyer<multipl2, 8>::value << std::endl;
}
