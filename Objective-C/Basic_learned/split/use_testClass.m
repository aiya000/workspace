#import <stdio.h>
#import <objc/Object.h>
#import "testClass.h"

int main(){
	id ins = [TestClass alloc];
	[ins method];
}
