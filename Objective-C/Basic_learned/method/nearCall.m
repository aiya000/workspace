#import <objc/Object.h>

@interface Test : Object
-(void)printa;
-(void)printb;
@end

@implementation Test
-(void)printa{
	printf("methodA\n");
	[self printb];
}

-(void)printb{
	printf("methodB\n");
}
@end

int main(){
	[ [Test alloc] printa ];
	return 0;
}
