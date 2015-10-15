#import <objc/Object.h>

@interface SelectorTest : Object
-(void)print;
@end

@implementation SelectorTest
-(void)print{
	printf("関数ポインタみたいなものらしい。なんのために？\n");
}
@end

int main(){
	id ins = [SelectorTest alloc];
	SEL printer = @selector(print);
	[ins perform:printer];

	return 0;
}
