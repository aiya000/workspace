[[deprecated("(A)")]]
void f() {}

[[deprecated("this messages was not shown")]]
void g() {}

[[deprecated("(B)")]]
void h() {}
void k() { h(); }

[[deprecated("(C)")]]
struct X {};

template <typename T>
struct Y {};

template <>
[[deprecated("(D)")]]
struct Y<int> {};

int main() {
	f();
}
