//この方法ではコンストラクタを再現することができる。

#import <objc/Object.h>

@interface Initest : Object
{
	int x;
}
-(id)init;		//コンストラクタの代わりになる
				//イニシャライズメソッド。
-(int)getX;
@end

@implementation Initest
-(id)init{
	[super init];		//テンプレ
	x = 0;
	printf("Initialize method Called\n");
	return self;		//テンプレ
}

-(int)getX{
	return x;
}
@end

int main(){
	id ins = [Initest new];		//イニシャライズ
	printf("X : %d\n", [ins getX]);

	return 0;
}
