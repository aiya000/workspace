#!/bin/bash
source ./include.sh

foo

array=(1 2 3)
echo `array_contains $array 1`
echo `array_contains $array 4`
