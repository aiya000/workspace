#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import codecs
sys.stdout = codecs.getwriter('utf_8')(sys.stdout)


# -------------------- #

print "Nice to meet you " + raw_input() + " !!"
print "Your birthday is " + raw_input() + " ."
print (lambda n:
        if n == 0:
            "一人っ子"
        elif n == 1:
            "二人っこ"
        elif n == 2:
            "3人っこ"
        else:
            "にぎやかな家庭")( int(raw_input() )

""" Time Out of Answer This Quest !!! """
