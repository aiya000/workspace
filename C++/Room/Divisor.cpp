#include <iostream>

void hoge(int n);
int main(){
	hoge(100);
}

void hoge(int n){
	int divisor;
	for(int i=1; i<=n; i++){
		divisor = 0;
		for(int j=1; j<=i; j++)
			if(i%j == 0)
				divisor++;
		if(divisor == 2)
			std::cout << i << std::endl;
	}
}

