#include "CursesException.hpp"
#include <fstream>
#include <iostream>

namespace alib {
	/* --==--==--==--==--==--==--==--==--==--==-- */
	CursesWindowException::CursesWindowException(std::string cause) :
		std::domain_error("CursesWindowException: " + cause),
		ERR_LOG("curses.err")
	{
		std::ofstream ferr(ERR_LOG, std::ios::out);
		ferr << "CursesWindowException: " + cause << std::endl;
	}

	CursesWindowException::CursesWindowException(std::string cause, WindowBounds bounds) :
		std::domain_error("CursesWindowException: " + cause),
		ERR_LOG("curses.err")
	{
		std::ofstream ferr(ERR_LOG, std::ios::out);
		ferr << "CursesWindowException: " << cause         << std::endl
		     << "Size["
		     << "x:"                      << bounds.x      << ","       << "y:" << bounds.y     << ","
		     << "h:"                      << bounds.height << ","       << "w:" << bounds.width
		     << "]"                       << std::endl;
	};

		/* --==--==--==--==--==--==--==--==--==--==-- */
}
