#include <iostream>
#include <string>
#include <stdexcept>
#include <typeinfo>
#include <cxxabi.h>
#include <cstdio>
#include <vector>
#include <memory>
#include <fstream>
#include <string.h>
#include <sstream>
#include <iterator>
#include <locale>
#include <tr1/array>
#include <utility>
#include <map>
#include <ctime>
#include <tr1/regex>
#include <regex>
#include <algorithm>

// 便利なの {{{
std::vector<std::string> split(const std::string& str, const char delimiter);
// }}}
// {{{
std::vector<std::string> split(const std::string& str, const char delimiter){
	std::vector<std::string> devided;
	int current = 0, i;
	for(i=0; i<str.size(); i++){
		if(str[i] == delimiter){
			devided.push_back( str.substr(current, i-current) );
			current = i+1;
		}
	}
	devided.push_back( str.substr(current) );
	return devided;
}
// }}}

class CistreamCsv {
friend CistreamCsv& endl(CistreamCsv& riscsv) {
	int iChar = 0;
	while ((iChar = riscsv.m_ris.get()) != '\n' && iChar != EOF) {}
	return riscsv;
}
private:
	std::istream& m_ris;
public:
	CistreamCsv(std::istream& ris) : m_ris(ris) {}
	CistreamCsv& operator >>(int& ri) {
		ri = 0;
		int iChar = 0;

		while (isspace(iChar = m_ris.get()) && iChar != '\n') {}
		if (iChar == EOF ) { return *this; }
		std::string strValue;
		if (iChar == '\n') { m_ris.putback(iChar); iChar = 0; }
		else               { strValue += iChar;               }

		while ((iChar = m_ris.get()) != ',' && iChar != EOF && iChar != '\n') {
			strValue += iChar;
		}
		ri = atoi(strValue.c_str());
		if (iChar == EOF ) { return *this;         }
		if (iChar == '\n') { m_ris.putback(iChar); }
		return *this;
	}

	CistreamCsv& operator >>(CistreamCsv& (*pmanipulatorfunction)(CistreamCsv&)) {
		return (*pmanipulatorfunction)(*this);
	}
};


auto main() -> int {
	CistreamCsv min(std::cin);
	std::string str;
	min >> str;
	std::cout << str << std::endl;
}
