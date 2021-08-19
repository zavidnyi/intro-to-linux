#!/bin/bash
tr -d '|' | cut -d$'\n' -f 10-19 | cut -b 10-28 
