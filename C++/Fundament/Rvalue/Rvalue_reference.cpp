#include <iostream>
#include <memory>

class X {
private:
	char* ptr;
public:
	X(){ ptr = new char[1000]; }
	~X(){ delete ptr; }

	X(const X& rvalue){  // 通常のコピーコンストラクタ
		/* コピーコンストラクタ故、参照ではなく値をコピーしなければいけない(負荷がかかる) */
		ptr = new char[1000];
		std::copy(&ptr[0], &ptr[1000], &rvalue.ptr[0]);
	}

	X(X&& rvalue){  // Moveコンストラクタ(右辺値参照を使ったコンストラクタ
		// 右辺値の持つ参照をぶっこ抜く
		// (Moveコンストラクタに渡される右辺値の元変数はもう使われることのない変数のはずなので[=]でぶっこ抜いても問題ない
		this->ptr = rvalue.ptr;
		rvalue.ptr = nullptr;  // これを書かなければデストラクタでランタイムエラーになるであろう…とのこと
	}
};


auto main() -> int {
	X ins;
	/* うんたら処理 */
	X ins0( std::move(ins) );  // Moveコンストラクタへmove、この後にinsは絶対に触れるなよっ！！
}
