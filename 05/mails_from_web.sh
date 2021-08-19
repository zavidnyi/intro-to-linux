#!/bin/bash

webpage="$( curl -s "$1" )"

echo "$webpage" | grep -io 'href="mailto:\{1\}[a-z0-9.\-]\+@[a-z0-9.\-]\+"' | cut -d: -f2 | cut -d'"' -f1 | sort
