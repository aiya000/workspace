#!/bin/sh
echo 'hoge:foo=ahoge' | awk -F'[:=]' '{print $1 " : " $3}'
