#pragma once
#include "CWindow.hpp"
#include "CursesException.hpp"
#include <vector>

namespace alib {
	class ContainableCWindow : public CWindow {
	private:
		std::vector<ContainableCWindow> m_childs;
	public:
		ContainableCWindow(int height, int width, int y, int x)
			throw(CursesWindowException);

		void addWindow(ContainableCWindow newChild);
		void addWindow(CWindow& newChild);

		void drawChildWindow(int index);
		ContainableCWindow getChildWindow(int index);
	};
}
