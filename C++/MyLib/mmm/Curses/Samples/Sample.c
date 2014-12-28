#include <stdio.h>
#include <stdlib.h>
#include <curses.h>
#include <math.h>
#include <unistd.h>
#include <time.h>
#include <signal.h>

#define WIN_NUM 10

void signal_handler(int SIG);

int main(void)
{
	WINDOW *windows[WIN_NUM];
	int ch;
	int win_lines;
	int win_cols;
	int win_count;
	int top_win_no;

	if(signal(SIGINT, signal_handler) == SIG_ERR ||
			signal(SIGQUIT, signal_handler) == SIG_ERR){
		fprintf(stderr, "signal failure\n");
		exit(EXIT_FAILURE);
	}

	if(initscr() == NULL){
		fprintf(stderr, "initscr failure\n");
		exit(EXIT_FAILURE);
	}

	cbreak();
	noecho();

	/* ウィンドウの各辺はそれぞれstdscrの2/3にする */
	win_cols = (int)floor(COLS * 2.0/3.0);
	win_lines = (int)floor(LINES * 2.0/3.0);

	srand(time(NULL));
	/* ウィンドウを作る */
	for(win_count = 0; win_count < WIN_NUM; win_count++){
		/* stdscrからはみ出ないように注意 */
		int i,j;
		int x = rand() % (COLS - win_cols);
		int y = rand() % (LINES - win_lines);
		windows[win_count] = newwin(win_lines, win_cols, y, x);
		/* 多分失敗しないと思うけど.... */
		if(windows[win_count] == NULL){
			win_count--;
			continue;
		}else{
			/* 何番のウィンドウか分かりやすくしてみた(つもり) */
			for(i = 3; i < win_lines; i++){
				for(j = 1; j < win_cols - 1; j++){
					mvwprintw(windows[win_count], i, j, "%d", win_count);
				}
			}
			box(windows[win_count], ACS_VLINE, ACS_HLINE);
			wrefresh(windows[win_count]);
		}
	}
	top_win_no = --win_count;

	while(1){
		/* 位置y,xはウィンドウの左上かどを0,0とした値 */
		mvwprintw(windows[top_win_no],
				1, 1, "Current Window NO =  %d: ",top_win_no);
		mvwprintw(windows[top_win_no],
				2, 1, "Select window 0 - %d: ",win_count);
		/* これをしないと選択ウィンドウの2,3行目しか再表示されないので
		 *        画面がグチャグチャになっていく */
		touchwin(windows[top_win_no]);
		wrefresh(windows[top_win_no]);

		/* ウィンドウ選択 */
		ch = wgetch(windows[top_win_no]);
		/* 選ばれたウィンドウを手前にする */
		if(ch >= '0' && ch <= '0'+WIN_NUM-1){
			top_win_no = atoi((char *)&ch);
		}else if(ch == 'q'){
			break;
		}
	}

	for(; win_count >= 0; win_count--){
		delwin(windows[win_count]);
	}

	endwin();
	exit(EXIT_SUCCESS);
}

/* やっつけ */
void signal_handler(int SIG){
	endwin();
	exit(EXIT_FAILURE);
}

