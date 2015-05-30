#!/bin/bash

declare -a array

readonly LEN=10
for ((i = 0; i < $LEN; ++i)) ; do
	array[$i]=$i
done

for ((i = 0; i < $LEN; ++i)) ; do
	echo ${array[$i]}
done
