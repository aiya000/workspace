#import <stdio.h>
#import <objc/Object.h>

@interface Sets : Object
{
	int x,y;
}
-(void)setX : (int)tx;
-(void)setY : (int)ty;
-(int)getX;
-(int)getY;
@end

@implementation Sets

-(void)setX : (int)x {
	self->x = x;
}

-(void)setY : (int)y {
	self->y = y;
}

-(int)getX {
	return x;
}

-(int)getY {
	return y;
}

@end

int main(){
	id ins = [Sets alloc];
	[ins setX:10];
	[ins setY:20];
	printf("x : %d\ny : %d\n", [ins getX], [ins getY]);

	return 0;
}
