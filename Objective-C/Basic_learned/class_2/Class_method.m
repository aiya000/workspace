#import <objc/Object.h>

/*
クラスメソッドのテスト
静的メソッドとほぼ同じものらしいけど、静的変数も表現が変わるみたい
*/

@interface ClassMethodTest : Object
//「+」でクラスメソッド
+(void)print;
@end

//static変数で、クラス変数の表現にできるらしい。
static int x;

@implementation ClassMethodTest
+(void)print{
	x = 0;
	printf("Class Method Called\n");
}
@end

int main(){
	[ClassMethodTest print];

	return 0;
}

