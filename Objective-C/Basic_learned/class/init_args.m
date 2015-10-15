#import <objc/Object.h>

@interface InitestArgs : Object
{
	int x;
}
-(id)init;
-(id)initWithInitestArgs:(int)x;
-(int)getX;
@end

@implementation InitestArgs
-(id)init{
	[super init];
	return [self initWithInitestArgs:0];
}
-(id)initWithInitestArgs:(int)x{
	self->x = x;
	return self;
}

-(int)getX{
	return x;
}
@end


int main(){
	id ins = [InitestArgs new];
	printf("x = %d\n", [ins getX]);
	id instance = [ [InitestArgs alloc] initWithInitestArgs:10 ];
	printf("x = %d\n", [instance getX]);
	
	return 0;
}
