#!/bin/bash

function words_contains () {
	words=$1
	elem=$2

	for word in $words ; do
		if [ -n "`echo $elem | grep $word`" ] ; then
			echo 1
			return
		fi
	done
	echo 0
}

WORDS="foo bar baz"
words_contains "$WORDS" bar
words_contains "$WORDS" hoge
