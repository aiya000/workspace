#include <iostream>
#include <tuple>
#include <array>
#include <vector>

typedef std::tuple<int,int> Point;

std::tuple<Point,Point> getSlashPoint();
std::vector<std::string> split(const std::string&, char);


int main(){
	auto point = getSlashPoint();
}


std::tuple<Point,Point> getSlashPoint(){
	std::string line;
	std::cin >> line;

	auto words = split(line, ' ');
	// 高階関数のmap使いたい
	std::array<int,4> params;
	std::cout << words.size() << std::endl;
	for(int i=0; i<4; i++){
		params[i] = std::atoi(words[i].c_str());
	}
	std::cout << "act7" << std::endl;

	return std::make_tuple(
		  std::make_tuple(params[0], params[1])
		, std::make_tuple(params[2], params[3])
	);
}

std::vector<std::string> split(const std::string& str, char delimitter){
	std::vector<std::string> result;
	size_t cur = 0, found;
	while( (found = str.find_first_of(delimitter, cur)) != std::string::npos){
		result.push_back(std::string(str, cur, found - cur));
		cur = found + 1;
	}

	result.push_back(std::string(str, cur, str.size() - cur));
	return result;
}
