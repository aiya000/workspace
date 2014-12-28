#include <iostream>
#include <string>

void openSocket(); // throws std::string
void openSocketWithError(); // throws int

int main(){
	try{ openSocket(); }
	catch(std::string e){ std::cerr << e << std::endl; }

	try{ openSocketWithError(); }
	catch(int e){ std::cerr << e << std::endl; }
	return 0;
}

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
void openSocket(){
	// IP to TCP
	int sock = socket(AF_INET, SOCK_STREAM, 0);
	if(sock < 0)
		throw std::string("socket failed");
}

#include <errno.h>
void openSocketWithError(){
	int illegalCallNum = 3000;
	int sock = socket(illegalCallNum, illegalCallNum, illegalCallNum);
	if(sock < 0){
		perror("socket");
		std::cerr << "socket" << std::endl;
		//throw errno;
	}
}
