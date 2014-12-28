#include <ncurses.h>
#include "obj_curses/Curses.hpp"
#include "obj_curses/ContainableCWindow.hpp"
#include <memory>
#include <stdexcept>

auto main() -> int {
	alib::Curses screen = alib::Curses::getInstance();
	auto func = [](){
		alib::Curses screen = alib::Curses::getInstance();
		//const int SCR_HEIGHT = screen.getmaxx();
		//const int SCR_WIDTH  = screen.getmaxy();
		//std::unique_ptr<alib::ContainableCWindow> root;
		//try{
		//	root.reset(new alib::ContainableCWindow(SCR_HEIGHT, SCR_WIDTH, 0, 0));
		//}catch(std::domain_error e){
		//	addstr(e.what());
		//	std::cout << e.what() << std::endl;
		//	screen.close();
		//	return;
		//}

		//bool loopFlag = true;
		//while(loopFlag){
		//	switch(root.nwgetch()){
		//	case 'q':
		//		loopFlag = false;
		//		break;
		//	}
		//}
	};
	screen.run(func);
}
