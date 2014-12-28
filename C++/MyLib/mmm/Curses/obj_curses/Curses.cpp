#include "Curses.hpp"
#include <sstream>
#include <string>


/* --==--==--==--==--==--==--==--==--==--==-- */
namespace alib {
	/* 基本動作の自動化 */
	Curses::Curses(bool useKeypad, bool echoFlag, bool cbreakFlag){
		initscr();
		keypad(stdscr, useKeypad);
		if(echoFlag)  echo();
		else  noecho();
		if(cbreakFlag)  cbreak();
		else  nocbreak();
	}
	Curses& Curses::getInstance(bool useKeypad, bool echoFlag, bool cbreakFlag){
		static Curses singleton(useKeypad, echoFlag, cbreakFlag);
		return singleton;
	}
	Curses::~Curses(){ this->close(); }
	void Curses::close(){ endwin(); }

	void Curses::run(void func()){
		func();
	}

	/* 独自関数 */
	int Curses::ngetmaxx(WINDOW *win){
		int y, x;  getmaxyx(win, y, x);
		return x;
	}
	int Curses::ngetmaxy(WINDOW *win){
		int y, x;  getmaxyx(win, y, x);
		return y;
	}

	/* --==--==--==--==--==--==--==--==--==--==-- */
}
