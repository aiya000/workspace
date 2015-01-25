#!/bin/sh

echo hoge foo | awk '{ print $1 }'
echo ahoge afoo afoge | awk '{ print $ 1 "..." $ 3 "!" }'
