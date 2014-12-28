#include <iostream>
#include <sstream>
#include <string>
#include <fstream>

int main(){
	std::ofstream out("fstream.txt", std::ios::out);
	out << "first"  << std::endl
	    << "second" << std::endl
	    << "third"  << std::endl;
	out.close();

	std::ifstream in("fstream.txt", std::ios::in);
	std::string text;
	in >> text;
	std::cout << text         << std::endl
	          << "----------" << std::endl;

	std::stringstream tss;
	std::string line;
	while( std::getline(in, line) )
		tss << line << std::endl;
	std::cout << tss.str();
}
