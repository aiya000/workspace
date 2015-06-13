#include <iostream>
#include <string>
#include <stdexcept>
#include <typeinfo>

class Exception : public std::domain_error {
public:
	Exception(const std::string& cause);
};
Exception::Exception(const std::string& cause) : std::domain_error(cause){}

template <typename T>
class Tester {
private:
	T m_element;
public:
	void setElement(T element) throw(Exception);
	T    getElement();
};
// 変な実装をしてみる
template <typename T>
void Tester<T>::setElement(T element) throw(Exception){
	throw Exception("not integer type");
	m_element = element;
}
template<typename T>
T Tester<T>::getElement(){ return m_element; }

int main(){
	Tester<std::string> st;
	Tester<int> it;
	try{
		st.setElement("10");
		it.setElement(20);

		std::cout << st.getElement() << std::endl;
		std::cout << it.getElement() << std::endl;
	}catch(const Exception& e){
		std::cout << e.what() << std::endl;
	}
}
