#import <objc/Object.h>

@interface InitestArgs : Object
{
	int x;
	int y;
}
-(id)init;
-(id)initWithInitestArgs:(int)x :(int)y;
-(int)getX;
-(int)getY;
@end

@implementation InitestArgs
-(id)init{
	[super init];
	return [self initWithInitestArgs:0 :0];
}
-(id)initWithInitestArgs:(int)x :(int)y{
	self->x = x;
	self->y = y;
	return self;
}

-(int)getX{
	return x;
}
-(int)getY{
	return y;
}
@end


int main(){
	id ins = [InitestArgs new];
	printf("x = %d\n y = %d\n", [ins getX], [ins getY]);
	id instance = [ [InitestArgs alloc] initWithInitestArgs:10 :20 ];
	printf("x = %d\n y = %d\n", [instance getX], [instance getY]);
	
	return 0;
}
