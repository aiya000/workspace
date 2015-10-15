#import <objc/Object.h>

@interface SuperClass : Object
-(void)print;
@end

@interface SubClass : SuperClass
-(void)print;
@end


@implementation SuperClass
-(void)print{
	printf("methodA\n");
}
@end

@implementation SubClass
-(void)print{
	[super print];
	printf("Super method Called\n");
}
@end

int main(){
	[ [SubClass alloc] print];
	return 0;
}	

