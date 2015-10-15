#import <objc/Object.h>

//クラス型宣言のテスト
@interface TestDeclaration : Object
-(void)print;
@end

@implementation TestDeclaration
-(void)print{
	printf("Declarate and Create is succeed\n");
}
@end

int main(){
	TestDeclaration* ins = [TestDeclaration new];
	[ins print];
	[ins free];

	return 0;
}
