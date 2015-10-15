#import <stdio.h>
#import <objc/Object.h>

@interface Point : Object
{
		int x, y;
}
- (id)init;
- (id)initWithPoint:(int)x int:(int)y;
- (int)getX;
- (int)getY;
@end

@implementation Point
- (id)init {
		[super init];
			return [self initWithPoint:0 int:0];
}
- (id)initWithPoint:(int)x int:(int)y {
		self->x = x;
			self->y = y;
				return self;
}

- (int)getX { return x; }
- (int)getY { return y; }
@end

int main() {
		id pt1 = [Point new];
			id pt2 = [[Point alloc] initWithPoint:400 int:300];

				printf("pt1.X=%d, pt1.Y=%d\n" , [pt1 getX] , [pt1 getY]);
					printf("pt2.X=%d, pt2.Y=%d\n" , [pt2 getX] , [pt2 getY]);

						return 0;
}
