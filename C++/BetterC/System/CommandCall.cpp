#include <iostream>
#include <cstdlib>

int main(){
	if( system("echo 'aaa'") == -1 )
		std::cerr << "Execution faild" << std::endl;

	FILE *pp = popen("ls", "r");
	char* file = new char[64];
	while( fscanf(pp, "%s", file) != EOF )
		std::cout << file << std::endl;
}
