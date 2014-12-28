#include <curses.h>


int main(){
	initscr();
	noecho();
	cbreak();
	/*------*/

	const int WIDTH = 50;
	const int HEIGHT = 40;
	const int X = 1;
	const int Y = 1;
	WINDOW *win = newwin(HEIGHT, WIDTH, Y, X);
	WINDOW *textarea[] = {
		newwin(3, 10, Y+10, X+3),
		newwin(3, 10, Y+20, X+3),
		newwin(3, 10, Y+30, X+3)
	};
	const int TEXTAREA_NUM = 3;

	box(win, ACS_VLINE, ACS_HLINE);
	wrefresh(win);
	for(int i=0; i<TEXTAREA_NUM; i++){
		box(textarea[i], ACS_VLINE, ACS_HLINE);
		wrefresh(textarea[i]);
	}

	while(1){
		mvwprintw(win, 5, 3, "Message");
		touchwin(win);
		wrefresh(win);
		for(int i=0; i<TEXTAREA_NUM; i++){
			mvwprintw(textarea[i], 3, 3, "area");
			touchwin(textarea[i]);
			wrefresh(textarea[i]);
		}

		if(wgetch(win) == 'q')
			break;
	}

	delwin(win);
	for(int i=0; i<TEXTAREA_NUM; i++)
		delwin(textarea[i]);

	/*------*/
	endwin();
}
