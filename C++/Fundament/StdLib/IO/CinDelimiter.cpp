// refer to http://stackoverflow.com/questions/7302996/changing-the-delimiter-for-cin-c
#include <locale>
#include <iostream>


struct colon_is_space : std::ctype<char> {
	colon_is_space() : std::ctype<char>(get_table()) {}
	static mask const* get_table() {
		static mask rc[table_size];
		rc[':'] = std::ctype_base::space;
		rc['\n'] = std::ctype_base::space;
		return &rc[0];
	}
};

int main() {
	using std::string;
	using std::cin;
	using std::locale;

	cin.imbue(locale(cin.getloc(), new colon_is_space));

	string word;
	cin >> word;  // exam: "aa aa aa"
	std::cout << word << "\n";
}
