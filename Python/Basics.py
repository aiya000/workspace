#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import codecs

# For JP output encoding
sys.stdout = codecs.getwriter('utf_8')(sys.stdout)


# IO {{{

# Std OutPut
print u"非改行Print",
print u"改行Print"

# Std Input
print "Please input:",
a = raw_input()
print "input: ", a

# }}}

# Basic Syntax {{{

# for
for i in range(1, 5):
    print i,
print

# if
if 1:
    print "foo!!"
elif 0:
    print "hoge"
else:
    print "oh"

# abnormal
x = 10
y = 20
x,y = y,x
print x, y

# }}}

# Operator {{{

print 2**5
print 2^2

# }}}

# Variables {{{

# Function Object
def hoge(x, y):
    return x + y
print hoge(10, 20)

# Lambda Function Object
print (lambda x, y: x + y)(10, 20)

# List and Dict
examList = [x*2 for x in range(10) if x%2 == 0]  # [x*2, x<-[0..10], not $ odd x]
examDict = {"a": 1, "b": 2}
print examList, examDict

# }}}

# StdLibs {{{

import random
print random.random()        # float in 0.0  to 1.0
print random.uniform(1, 30)  # float in arg1 to arg2
print random.randint(1, 30)  # int in rag1 to arg2
print random.choice("abcdefghijklmnopqrstuvwxyz")   # choice one in array element
cList = "abcdefghijklmnopqrstuvwxyz"
random.shuffle( list(cList) )  # shuffle list ...?
print cList

# }}}
