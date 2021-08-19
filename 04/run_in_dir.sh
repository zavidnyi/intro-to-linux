#!/bin/bash
cd 01 2> /dev/null && test -s input.txt 2> /dev/null && wc -w input.txt  2> /dev/null | cut -f 1 -d' ' || echo "0"
