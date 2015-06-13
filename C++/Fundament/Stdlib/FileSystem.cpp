#include <iostream>
#include <filesystem>
#include <algorithm>

/* できない */
int main(){
	namespace sys = std::tr2::sys;
	sys::path p(".");
	std::for_each(sys::directory_iterator(p), sys::directory_iterator(), [](const sys::path& p){
		if(sys::is_regular_file(p))
			std::cout << "file: " << p.filename() << std::endl;
		else if(sys::is_directory(p))
			std::cout << "dir:  " << p.string()   << std::endl;
	});
}
