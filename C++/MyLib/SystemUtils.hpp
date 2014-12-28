#pragma once
#include <stdexcept>
#include <string>

namespace alib {

	/* --==--==--==--==--==--==--==--==--==--==-- */
	class SystemCommandCallException : public std::runtime_error {
	public:
		SystemCommandCallException(std::string cause);
	};

	/* --==--==--==--==--==--==--==--==--==--==-- */
	/**
	 * Usage:
	 *   std::string shellV = alib::getShellVar("$HOME");
	 */
	std::string getShellVar(const std::string& var) throw(SystemCommandCallException);

}
