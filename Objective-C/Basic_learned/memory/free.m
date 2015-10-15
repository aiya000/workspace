#import <objc/Object.h>

@interface TestFree : Object
-(id)free;
@end

@implementation TestFree
-(id)free{
	printf("instance released\n");
	return [super free];
}
@end

int main(){
	id ins = [TestFree new];
	[ins free];

	return 0;
}
