#include "CWindow.hpp"
#include <sstream>
#include <iostream>
#include <string>

namespace alib {

	/* --==--==--==--==--==--==--==--==--==--==-- */

	/* 拡張構造体のメンバ */
	CWindow::CWindow(int height, int width, int y, int x) throw(CursesWindowException) :
		height(height), width(width), y(y) ,x(x)
	{
		window = newwin(height, width, y, x);
		if(!window){
			std::stringstream cause;
			cause << "CWindow Create Failed"    << std::endl
				<< "Size["
				<< "x:"    << x      << "," << "y:" << y     << ","
				<< "h:"    << height << "," << "w:" << width
				<< "]"     << std::endl;
			throw CursesWindowException(cause.str());
		}
		box(window, ACS_VLINE, ACS_HLINE);
		wrefresh(window);
	}
	CWindow::~CWindow(){
		delwin(window);
	}

	/* 独自関数 */
	void CWindow::draw(){
		touchwin(this->window);
		wrefresh(this->window);
	}
	WindowBounds CWindow::getWindowBounds(){
		return WindowBounds{this->height, this->width, this->y, this->x};
	}

	/* Curses関数のオーバーライド */
	/* keypad(this->window, flag)にするとコアダンプするので
	 * stdscrでのグローバルな設定と取得にして、
	 * フェイク(擬似的)な実装にする。
	 */
	int CWindow::nkeypad(bool flag){ return keypad(stdscr, flag); }
	int CWindow::nwgetch(){
		this->draw();
		return getch();
	}
	int CWindow::nmvwprintw(int y, int x, const char* msg, ...){
		va_list args;
		va_start(args, msg);

		int ret = mvwprintw(this->window, y, x, msg, args);
		touchwin(this->window);
		wrefresh(this->window);

		va_end(args);
		return ret;
	}

	/* --==--==--==--==--==--==--==--==--==--==-- */
}
