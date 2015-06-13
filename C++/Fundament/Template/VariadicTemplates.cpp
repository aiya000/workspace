template <typename... Ts>
void f(Ts... args) {}

template <typename T, typename... Ts>
T head(T value, Ts...) {
	return value;
}

template <typename... Ts>
auto g(Ts... args) -> decltype( head(args...) ) {
	return head(args...);
}

int main() {
	f(10, 20.0, 'a');
	auto a = g(10, 20.0, 'a');
}
