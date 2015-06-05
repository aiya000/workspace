#!/bin/sh

foo () {
	echo 'foo'
}

array_contains () {
	for i in $1 ; do
		if [ "$i" == "$2" ] ; then
			echo 1
			return
		fi
	done
	echo 0
}
