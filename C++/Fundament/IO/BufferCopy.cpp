#include <iostream>
#include <sstream>
#include <fstream>

int main(){
	std::stringstream ss;
	ss << "abc def";
	std::ofstream fs("buffer.log");
	fs << ss.rdbuf();
}
