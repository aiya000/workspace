#include <iostream>
#include <cstdlib>
#include <unistd.h>

int main(int argc, char** argv){
	char buf[127];
	
	//if(argc < 2){
	//	std::cerr << "too few args." << std::endl;
	//	return -1;
	//}

	FILE* fp = popen(argv[1], "r");
	if(fp == nullptr){
		std::cerr << "パイプ開けん。" << std::endl;
		return -1;
	}

	while(fgets(buf, sizeof(buf), fp) != nullptr)
		std::cout << "なんてことはないもの is " << buf << std::endl;

	pclose(fp);
}
