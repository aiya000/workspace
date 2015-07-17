#pragma once
#include <ncurses.h>
#include <fstream>
#include <stdexcept>
#include <string>
#include <cstdarg>


/* --==--==--==--==--==--==--==--==--==--==-- */
class Curses {
private:
	/* 基本動作の自動化 */
	Curses(bool echoFlag, bool cbreakFlag);
public:
	static Curses& getInstance(bool echoFlag=false, bool cbreakFlag=true);
	~Curses();
	void close();
	void run(void func());

	/* 独自関数 */
	int ngetmaxx(WINDOW *win);
	int ngetmaxy(WINDOW *win);

	/* Curses関数のオーバーライド */
	int necho();
	int nnoecho();
	int ncbreak();
	int nnocbreak();
	int nmove(int y, int x);
	void ngetmaxyx(WINDOW *win, int y, int x);
};

/* --==--==--==--==--==--==--==--==--==--==-- */
class NcursesWindowException : public std::domain_error {
public:
	NcursesWindowException(std::string cause);
};

/* --==--==--==--==--==--==--==--==--==--==-- */
struct WindowBounds {
	int height, width;
	int y, x;
};

/* --==--==--==--==--==--==--==--==--==--==-- */
struct Window {
	/* 拡張構造体のメンバ */
	Window(int height, int width, int y, int x) throw(NcursesWindowException);
	~Window();
	WINDOW* window;
	int height, width, y, x;

	/* 独自関数 */
	void draw();
	//int mvCursorThisWindow();
	WindowBounds getWindowBounds();

	/* Curses関数のオーバーライド */
	int nwgetch();
	int nmvwprintw(int y, int x, const char* msg, ...);
};

/* --==--==--==--==--==--==--==--==--==--==-- */

