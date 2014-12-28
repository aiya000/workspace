#include <iostream>
#include <iterator>

auto main() -> int {
	std::ostream_iterator<int> mcout(std::cout, ",");
	*mcout = 10;
	*mcout = 20;
	*mcout = 30;
}
