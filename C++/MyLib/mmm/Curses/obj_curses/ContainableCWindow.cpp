#include "ContainableCWindow.hpp"

namespace alib {
	ContainableCWindow(int height, int width, int y, int x) throw(CursesWindowException) :
		CWindow(height, width, y, x){}

	void ContainableCWindow::addWindow(ContainableCWindow newChild){
		m_childs.push_back(newChild);
	}
	void ContainableCWindow::addWindow(CWindow& newChild){
		ContainableCWindow copiedChild
			(newChild.height, newChild.width, newChild.y, newChild.x);
		m_childs.push_back(copiedChild);
	}

	void ContainableCWindow::drawChildWindow(int index){
		m_childs[index].draw();
	}
}
