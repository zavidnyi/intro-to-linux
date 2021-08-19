#!/bin/bash
tr -d '|' | tr -s ' ' | awk '{$1=$1};1' | tr " " + | bc
