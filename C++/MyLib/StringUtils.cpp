#include "StringUtils.hpp"
#include <cstdio>
#include <cstdarg>

namespace alib {

	/* --==--==--==--==--==--==--==--==--==--==-- */
	std::string format(const char* format, ...){
		char f[512];
		va_list args;

		va_start(args, format);
		std::vsprintf(f, format, args);
		va_end(args);

		return std::string(f);
	}
	std::string format(const std::string& format, ...){
		char f[512];
		va_list args;

		va_start(args, format);
		std::vsprintf(f, format.c_str(), args);
		va_end(args);

		return std::string(f);
	}
	/* --==--==--==--==--==--==--==--==--==--==-- */

}

//#include <iostream>
//#include <ctime>
//auto main() -> int {
//	std::string str = alib::format(std::string()+
//		"INSERT INTO %s(time, function, target, comment)" +
//		" VALUES(%ld, %s, %s, %s);",
//		"TABLE", std::time(nullptr), "func", "target", "comment"
//		);
//
//}
