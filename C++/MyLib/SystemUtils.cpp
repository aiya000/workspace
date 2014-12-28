#include "SystemUtils.hpp"

namespace alib {

	/* --==--==--==--==--==--==--==--==--==--==-- */
	SystemCommandCallException::SystemCommandCallException(std::string cause)
		: std::runtime_error("SystemCommandCallException" + cause){}

	/* --==--==--==--==--==--==--==--==--==--==-- */
	std::string getShellVar(const std::string& var) throw(SystemCommandCallException){
		std::string shV = "";
		FILE *pp = popen( ("echo " + var).c_str(), "r");
		char home[256];
		int err = fscanf(pp, "%s", home);
		if(err == EOF)
			throw SystemCommandCallException("Reading Shell variable[" + var + "] failed");

		return std::string(home);
	}

	/* --==--==--==--==--==--==--==--==--==--==-- */
}
