#pragma once
#include "CursesData.hpp"
#include <stdexcept>
#include <string>

namespace alib {
	/* --==--==--==--==--==--==--==--==--==--==-- */
	class CursesWindowException : public std::domain_error {
	private:
		const std::string ERR_LOG;

	public:
		CursesWindowException(std::string cause);
		// 本当はstd::domain_error#what()にもエラーログを流せればいいのだけど…。
		CursesWindowException(std::string cause, WindowBounds bounds);
	};

	/* --==--==--==--==--==--==--==--==--==--==-- */
}
