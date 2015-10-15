#import <objc/Object.h>

//カテゴリでは、既存のインターフェイスにメソッドを追加することができる。
//このソースでは "Cate" カテゴリで追加しているということになる。

@interface CateTest : Object
-(void)print;
@end

@implementation CateTest
-(void)print{
	printf("Method type \"1\" Called\n");
}
@end

@interface CateTest (Cate)
-(void)print2;
@end

@implementation CateTest (Cate)
-(void)print2{
	printf("Method type \"2\" Called\n");
}
@end

int main(){
	CateTest* ins = [CateTest alloc];
	[ins print];
	[ins print2];
	[ins free];

	return 0;
}
