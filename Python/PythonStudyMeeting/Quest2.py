#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import codecs
sys.stdout = codecs.getwriter('utf_8')(sys.stdout)

# -------------------- #

import random
for o in [
            random.random(),  #random.uniform(0.0, 1.0),
            random.uniform(70.0, 100.0),
            random.randint(10, 20),
            random.choice("abcd"),
            [
                random.uniform(0.0, 10.0),
                random.random() * 10  # profeccer's ans.  hoe~~.
            ],
            u"ランダムに選んだ数は" +
                str( random.uniform(0.0, 1.0) ) + u"です。"
            ]:
    print o

