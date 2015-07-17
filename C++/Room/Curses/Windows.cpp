#include "Curses.h"
#include <memory>
#include <iostream>
#include <fstream>

int main(){
	Curses screen = Curses::getInstance();

	auto func = [](){
		Curses screen = Curses::getInstance();
		const int SCR_HEIGHT = screen.ngetmaxy(stdscr);
		const int SCR_WIDTH  = screen.ngetmaxx(stdscr);

		std::unique_ptr<Window> main;
		std::unique_ptr<Window> textarea[3];
		try{
			main.reset(new Window(SCR_HEIGHT-3, SCR_WIDTH-1, 1, 1));
			textarea[0].reset(new Window(3, 10, main->y+10, main->x+3));
			textarea[1].reset(new Window(3, 10, main->y+20, main->x+3));
			textarea[2].reset(new Window(3, 10, main->y+30, main->x+3));
		}catch(NcursesWindowException e){
			std::ofstream ferr("ncurses.err", std::ios::out);
			ferr << e.what() << std::endl;
			addstr(e.what());
			screen.close();
			return;
		}
		const int TEXTAREA_NUM = 3;

		main->nmvwprintw(5, 3, "Message");
		for(int i=0; i<TEXTAREA_NUM; i++){
			textarea[i]->nmvwprintw(1, 1, "area");
		}

		int cursorAreaP = 0;
		bool loopFlag = true;
		while(loopFlag){
			textarea[cursorAreaP]->draw();

			switch(main->nwgetch()){
			//switch(textarea[cursorAreaP]->nwgetch()){
			case 0x09:    // KEY_TAB
			case KEY_DOWN:
				if(TEXTAREA_NUM-1 > cursorAreaP)
					cursorAreaP++;
				else
					cursorAreaP = 0;
				break;
			case 0x0231:  // KEY_UP
			case KEY_UP:
				if(0 < cursorAreaP)
					cursorAreaP--;
				break;

			case ' ':
			case 0x0a:
			case 0x0d:  // KEY_ENTER

			case 'q':
				loopFlag = false;
				break;
			}
		}
	};

	screen.run(func);
}
