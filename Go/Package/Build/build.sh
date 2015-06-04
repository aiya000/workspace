#!/bin/sh
go build

if [ -x ./Build.exe ] ; then
	echo "Build.exe was built."
	./Build.exe
elif [ -x ./Build ] ; then
	echo "Build was built."
	./Build
else
	echo "Does building is failed ?"
fi
