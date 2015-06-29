#include <iostream>

struct A {
	int x;
	friend std::ostream& operator<<(std::ostream& os, A& a) {
		return os << "A{x}: " << a.x;
	}
};

int main() {
	auto a = A{10};
	std::cout << a << std::endl;
}
