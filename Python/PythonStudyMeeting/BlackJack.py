#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import codecs
sys.stdout = codecs.getwriter('utf_8')(sys.stdout)


#
#  ブラックジャックのようななにか
#

import random

def blackjack():
    cards = sum([range(1, 13), range(1, 13), range(1, 13), range(1, 13)], [])
    for i in range(12):
        l, r = random.randint(0, 12*4-1), random.randint(0, 12*4-1)
        cards[l], cards[r] = cards[r], cards[l]
    winCase = 2  # 0:lose, 1:win, 2:draw
    playerScore, cpuScore = 0, 0

    def draw():  # {{{
        card = cards[0]
        cards.pop(0)
        return card
    # }}}
    def compareJudgment():  # {{{
        global winCase
        if playerScore > cpuScore:
            winCase = 1
        elif cpuScore > playerScore:
            winCase = 0
        else:
            winCase = 2
    # }}}
    def overflowJudgment():  # {{{
        # return: continue or not continue of phase
        global winCase
        if (cpuScore > 21) and (playerScore > 21):
            winCase = 2
            print ">> Player Score and CPU Score is Double Break !!"
            return True
        else:
            if cpuScore > 21:
                print ">> CPU Score is Break !!"
                winCase = 1
                return True
            elif playerScore > 21:
                print ">> Player Score is Break !!"
                winCase = 0
                return True
        return False
    # }}}

    # -------------------- #

    playerScore, cpuScore = draw(), draw()
    gameEnd = False
    print "----------"
    while not gameEnd:
        print "score: ", playerScore
        print "please draw ?(0/1): ",
        playerWant = int(raw_input()) == 1
        cpuWant = random.randint(0,1) == 1

        if cpuWant:
            print "CPU draw."
            cpuScore += draw()
        else:
            print "CPU do not draw."


        if playerWant:
            print "Player draw."
            playerScore += draw()
        else:
            print "Player do not draw."


        if overflowJudgment():
            gameEnd = True
        else:
            print ">> Next Phase"
            print "-------------"


    print
    print "Player Score: ", playerScore
    print "CPU Score: ", cpuScore
    if winCase == 1:
        print
        print "You Win !!"
    elif winCase == 0:
        print
        print "You Lose..."
    else:
        print
        print "Draw !"

blackjack()
