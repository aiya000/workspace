#import <Foundation/Foundation.h>

//わーい！！念願のNSObjectクラスだぞー！！！Foundation.hだぞー！！
@interface ClassTest : NSObject
-(id)init;
-(void)print:(NSString*)message;
@end

@implementation ClassTest
-(id)init{
	[super init];
	NSLog(@"Instance Created\n");
	return self;
}
-(void)print:(NSString*)message{
	NSLog(@"%@\n", message);
}
@end

int main(){
	//Foudationで文字列はNSString*、@文字列で表す
	NSString* str = @"TestString";

	//インスタンス生成は普通
	ClassTest* ins = [ClassTest new];

	//メソッド実行も普通(アロー演算子とドット演算子の境目はないのか？)
	[ins print:str];

	//メモリ解放はfreeではなくreleaseを使う、多分
	[ins release];

	return 0;
}
