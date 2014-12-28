#include "Curses.h"
#include <memory>
#include <vector>
#include <iostream>
#include <fstream>

int main(){
	Curses screen = Curses::getInstance();

	auto func = [](){
		/* データ */
		Curses screen = Curses::getInstance();
		const int SCR_HEIGHT = screen.ngetmaxy();
		const int SCR_WIDTH  = screen.ngetmaxx();

		std::unique_ptr<Window> main;
		main->nkeypad(true);
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
		std::vector< std::unique_ptr<Window>* > allWin; {
			allWin.push_back(&main);
			for(int i=0; i<TEXTAREA_NUM; i++)
				allWin.push_back(&textarea[i]);
		}


		/* 動作部 */
		main->nmvwprintw(5, 3, "Message");
		for(int i=0; i<TEXTAREA_NUM; i++){
			textarea[i]->nmvwprintw(1, 1, "area");
		}

		int cursorAreaP = 0;
		bool loopFlag = true;
		while(loopFlag){
			textarea[cursorAreaP]->draw();

			switch(main->nwgetch()){
			case KEY_STAB:    // KEY_TAB
			case KEY_DOWN:
			case 'j':
				if(TEXTAREA_NUM-1 > cursorAreaP)
					cursorAreaP++;
				else
					cursorAreaP = 0;
				break;
			case KEY_UP:
			case 'k':
				if(0 < cursorAreaP)
					cursorAreaP--;
				break;

			case ' ':
			case KEY_ENTER:

			case 'q':
				loopFlag = false;
				break;
			}
		}
	};

	screen.run(func);
}
