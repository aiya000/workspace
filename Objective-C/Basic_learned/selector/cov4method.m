#import <objc/Object.h>

//オブジェクトのメソッドから関数への変換
@interface ConvertTest : Object
{
	int count;
}
-(void)print;
@end

@implementation ConvertTest
-(void)print{
	printf("Print Method Called : %d\n", count++);
}
@end

int main(){
	id ins = [ConvertTest alloc];
	[ins print];
	SEL methodSel = @selector(print);

	//関数保持型？変数宣言
	IMP func = [ConvertTest instanceMethodFor:methodSel];
	//実行、引数は（元のインスタンス, セレクタ）の順番
	func(ins, methodSel);

	return 0;
}

//利点としては、
//	・こちらの方が呼び出し速度が速いこと
//　・より純粋なC言語に適していること
//らしい
