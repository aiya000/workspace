#import <stdio.h>
#import <objc/Object.h>

@interface Point : Object
{
	int x, y;
}
- (void)setPoint:(int)ptx int:(int)pty;
- (int)getX;
- (int)getY;
@end

@implementation Point
- (void)setPoint:(int)x int:(int)y {
	self->x = x;
	self->y = y;
}
- (int)getX {
	return x;
}
- (int)getY {
	return y;
}
@end

int main() {
	id point1 , point2;
	point1 = [Point alloc];
	point2 = [Point alloc];

	[point1 setPoint:32 int:64];
	[point2 setPoint:256 int:128];

	printf("point1:X=%d, Y=%d\n", [point1 getX] , [point1 getY]);
	printf("point2:X=%d, Y=%d\n", [point2 getX] , [point2 getY]);
	return 0;
}
