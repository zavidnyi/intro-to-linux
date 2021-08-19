#!/bin/bash
cut -d:  -f 3 | sort -n | tail -n 5 | paste -sd+ | bc
