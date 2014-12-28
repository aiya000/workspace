#include <ncurses.h>
#include <iostream>

int main(){
	initscr();
	char ch = getch();
	endwin();
	std::cout << std::hex << ch << std::endl;
	std::cout << (ch == KEY_DOWN) << std::endl;
}
