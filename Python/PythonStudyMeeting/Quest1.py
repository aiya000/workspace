#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import codecs
sys.stdout = codecs.getwriter('utf_8')(sys.stdout)


# -------------------- #

print 1
print "5+6=10"
print "aiya_000"
print "1994/02/12", "-" , 19940212

a = raw_input()
print a
print "a"

a = raw_input()
b = raw_input()
print a + u"は" + b + u"生まれです。"

print "5+6=" + str(5 + 6)

