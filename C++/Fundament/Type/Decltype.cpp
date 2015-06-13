#include <iostream>

template <typename T, typename... Ts>
T head(T value, Ts...) {
	return value;
}

template <typename... Ts>
auto g(Ts... args) -> decltype( head(args...) ) {
	return head(args...);
}

int main() {
	auto a = g(10, 20.0, 'a');
	std::cout << a << std::endl;
}
