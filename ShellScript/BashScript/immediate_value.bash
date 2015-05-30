#!/bin/bash

# same as expr command
let a=$(( 10 + 20 ))
let b=$((  a *  2 ))  # without '$'

echo $b
