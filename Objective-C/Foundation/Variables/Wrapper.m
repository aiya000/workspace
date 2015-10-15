#import <Foundation/Foundation.h>

int main(){
	//謎インスタンス
	NSAutoreleasePool *pool = [ [NSAutoreleasePool alloc] init];

	//intラッパー
	NSNumber *wInteger = [NSNumber numberWithInt:10];

	//doubleラッパー
	NSNumber *wDouble = [NSNumber numberWithDouble:10.01];

	//値の取得
	printf("wrapped Int : %d\n", [wInteger intValue]);
	printf("wrapped Int to Double : %lf\n", [wInteger doubleValue]);
	printf("wrapped Double : %lf\n", [wDouble doubleValue]);
	printf("wrapped Double to Int : %d\n", [wDouble intValue]);
	printf("wrapped Double to String : %s\n", [ [wDouble stringValue] UTF8String]);
	
	[pool drain];
	return 0;
}
