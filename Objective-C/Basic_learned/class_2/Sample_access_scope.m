#import <stdio.h>
#import <objc/Object.h>

@interface A : Object
{
@public
		int a;
@protected
		int b;
@private
		int c;
}
- (id)initWithA:(int)a int:(int)b int:(int)c;
- (void)WriteA;
@end

@interface B : A
- (void)WriteB;
@end

@implementation A
- (id)initWithA:(int)a int:(int)b int:(int)c {
	self->a = a;
	self->b = b;
	self->c = c;
	return self;
}
- (void)WriteA {
	printf("[A Write Method, a=%d, b=%d, c=%d]\n", a , b , c);
}
@end

@implementation B
- (void)WriteB {
	printf("[B Write Method, a=%d, b=%d]\n", a , b);
}
@end

int main() {
	B * objb = [[B new] initWithA:1000 int:100 int:10];
	printf("[main() scope, a=%d]\n" , objb->a);
	[objb WriteB];
	[objb WriteA];
	[objb free];
	return 0;
}
