#pragma once
#include <ncurses.h>

namespace alib {
	/* --==--==--==--==--==--==--==--==--==--==-- */
	class Curses {
	private:
		/* 基本動作の自動化 */
		Curses(bool useKeypad, bool echoFlag, bool cbreakFlag);
	public:
		static Curses& getInstance(
				bool useKeypad  = true,
				bool echoFlag   = false,
				bool cbreakFlag = true);
		virtual ~Curses();
		void close();
		void run(void func());

		/* 独自関数 */
		int ngetmaxx(WINDOW *win = stdscr);
		int ngetmaxy(WINDOW *win = stdscr);
	};

	/* --==--==--==--==--==--==--==--==--==--==-- */
}

