#include <iostream>
#include <utility>
#include <map>

auto main() -> int {
	std::pair<int, bool> pair(10, true);
	std::cout << pair.first << '|' << pair.second << std::endl;

	// omake
	std::map<int, bool> map;
	for(int i=0; i<5; i++){
		map.insert( pair );
		pair.first++;
	}
	for(auto m : map)
		std::cout << m.first << '|' << m.second << std::endl;
}
