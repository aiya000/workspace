#include "Curses.h"
#include <sstream>
#include <string>


/* --==--==--==--==--==--==--==--==--==--==-- */
/* 基本動作の自動化 */
Curses::Curses(bool echoFlag, bool cbreakFlag){
	initscr();
	if(echoFlag)  echo();
	else  noecho();
	if(cbreakFlag)  cbreak();
	else  nocbreak();
}
Curses& Curses::getInstance(bool echoFlag, bool cbreakFlag){
	static Curses singleton(echoFlag, cbreakFlag);
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

/* Curses関数のオーバーライド */
int Curses::necho()     { return echo();     }
int Curses::nnoecho()   { return noecho();   }
int Curses::ncbreak()   { return cbreak();   }
int Curses::nnocbreak() { return nocbreak(); }
int Curses::nmove(int y, int x){ return move(y, x); }
void Curses::ngetmaxyx(WINDOW *win, int y, int x){ getmaxyx(win, y, x); }

/* --==--==--==--==--==--==--==--==--==--==-- */
NcursesWindowException::NcursesWindowException(std::string cause) :
	std::domain_error("NcursesWindowException: " + cause){}

/* --==--==--==--==--==--==--==--==--==--==-- */

/* 拡張構造体のメンバ */
Window::Window(int height, int width, int y, int x) throw(NcursesWindowException) :
	height(height), width(width), y(y) ,x(x)
{
	window = newwin(height, width, y, x);
	if(!window){
		std::stringstream cause;
		cause << "Window Create Failed"    << std::endl
		      << "Size["
			  << "x:"    << x      << "," << "y:" << y     << ","
			  << "h:"    << height << "," << "w:" << width
			  << "]"     << std::endl;
		throw NcursesWindowException(cause.str());
	}
	box(window, ACS_VLINE, ACS_HLINE);
	wrefresh(window);
}
Window::~Window(){
	delwin(window);
}

/* 独自関数 */
void Window::draw(){
	touchwin(this->window);
	wrefresh(this->window);
}
//int Window::mvCursorThisWindow(){
//	return wmove(this->window, this->y, this->x);
//}
WindowBounds Window::getWindowBounds(){
	return WindowBounds{this->height, this->width, this->y, this->x};
}

/* Curses関数のオーバーライド */
int Window::nwgetch(){
	return wgetch(this->window);
}
int Window::nmvwprintw(int y, int x, const char* msg, ...){
	va_list args;
	va_start(args, msg);

	int ret = mvwprintw(this->window, y, x, msg, args);
	touchwin(this->window);
	wrefresh(this->window);

	va_end(args);
	return ret;
}

/* --==--==--==--==--==--==--==--==--==--==-- */

