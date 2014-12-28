#include <iostream>
#include <ctime>
#include <typeinfo>

long timestampToSeconds(const char* timestamp){
	std::tm tmStruct;
	strptime(timestamp, "%Y-%m-%d %H:%M:%S", &tmStruct);
	tmStruct.tm_isdst = 1;
	long t = std::mktime(&tmStruct);
	
	return t;
}

int main(){
	std::cout << timestampToSeconds("2013-07-05 12:34:56") << std::endl;
	std::cout << timestampToSeconds("2013-07-05") << std::endl;
}
