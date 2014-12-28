#include <string>
#include "SystemUtils.hpp"

namespace alib {
	/**
	 * Usage:
	 *   std::string str = alib::format("%d-%f-%s", 10, 20.0, "30");
	 */
	std::string format(const char* format, ...);
	std::string format(const std::string& format, ...);
}
