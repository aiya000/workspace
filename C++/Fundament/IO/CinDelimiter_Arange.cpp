#include <locale>
#include <iostream>

void unsetStreamDelimiterSpace(std::istream& in){
	struct DelimiterSpace : std::ctype<char> {
		DelimiterSpace() : std::ctype<char>([](){
			static mask rc[table_size];
			rc['\n'] = std::ctype_base::space;
			return &rc[0];
		}()){}
	};
	in.imbue( std::locale(in.getloc(), new DelimiterSpace()) );
}

int main() {
	unsetStreamDelimiterSpace(std::cin);

	std::string str;
	std::cin >> str;
	std::cout << str << std::endl;
}
