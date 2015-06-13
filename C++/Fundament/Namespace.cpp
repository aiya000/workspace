#include <iostream>
#include <string>

namespace first {
	namespace second {
		struct S {
			std::string access = "succeed";
		};
	}
}

int main(){
	namespace name = first::second;
	name::S ins;
	std::cout << ins.access << std::endl;
}
