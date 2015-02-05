#!/bin/sh
find ~/.rbenv/ -name '*.so'   > /tmp/rall_list.txt
find ~/.rbenv/ -name '*.dll' >> /tmp/rall_list.txt
echo '--- result ---'
cat /tmp/rall_list.txt
echo '--------------'
