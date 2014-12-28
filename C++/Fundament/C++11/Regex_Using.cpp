#include <iostream>
#include <regex>
#include <string>
#include <vector>

// なんでg++ 4.8.1だとうまくいかない？
auto main() -> int {
	std::regex regex(".*");
	std::regex regex0("[0-9]+", std::regex_constants::extended);
	std::string str = "This is a pen.";
	std::cout << std::regex_search(str.begin(), str.end(), regex) << std::endl;
	std::cout << std::regex_search("12345678990", regex0) << std::endl;

	std::cmatch match;
	std::regex_search(str.c_str(), match, regex);
	if(!match.empty()){
		std::cout << match.size() << " match." << std::endl;
		for(std::csub_match subMatch : match)
			std::cout << subMatch.str() << std::endl;
	}

	std::cmatch ma;
	std::regex regnew("\\w\\s");
	std::regex_search(str.c_str(), ma, regnew);
	for(std::csub_match sub : ma)
		std::cout << sub.str() << ", ";
	std::cout << std::endl;
}
