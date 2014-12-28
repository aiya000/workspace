#pragma once
#include <ncurses.h>
#include "CursesException.hpp"
#include "CursesData.hpp"
#include <cstdarg>

namespace alib {
	/* --==--==--==--==--==--==--==--==--==--==-- */
	struct CWindow {
		/* 拡張構造体のメンバ */
		CWindow(int height, int width, int y, int x) throw(CursesWindowException);
		virtual ~CWindow();
		WINDOW* window;
		int height, width, y, x;

		/* 独自関数 */
		void draw();
		WindowBounds getWindowBounds();

		/* Curses関数のオーバーライド */
		int nkeypad(bool flag);
		int nwgetch();
		int nmvwprintw(int y, int x, const char* msg, ...);
	};

	/* --==--==--==--==--==--==--==--==--==--==-- */
}
