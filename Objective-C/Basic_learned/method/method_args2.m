#import <objc/Object.h>

@interface Args : Object
{
	int x,y;
}
-(void)sets: (int)x: (int)y;
-(int)getX;
-(int)getY;
@end

@implementation Args
-(void)sets: (int)x: (int)y{
	self->x = x;
	self->y = y;
}

-(int)getX{
	return x;
}

-(int)getY{
	return y;
}
@end

int main(){
	id ins = [Args alloc];
	[ins sets: 10: 20];
	printf("X = %d\nY = %d\n", [ins getX], [ins getY]);

	return 0;
}
