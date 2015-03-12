#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import codecs
sys.stdout = codecs.getwriter('utf_8')(sys.stdout)


# -------------------- #

for i in [1, 2, 3]:
    print (lambda x: x^2+x+1)(i)

# print (lambda a, b: if a%2 == 0 a+b else a-b))(10, 5)  # くっ！！ lambda-ifはどうすればいいだっ！！

def func(x):
    if x == 0:
        return u"一人っ子"
    elif x == 1:
        return u"二人っこ"
    elif x == 2:
        return u"三人っこ"
    else:
        return u"子だくさん"
for i in [0, 1, 2, 5, 60]:
    print func(i)


""" Time was Broken !!! """
"""    Time Out !!!     """
