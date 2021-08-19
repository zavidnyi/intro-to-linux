#!/bin/bash
tr -d '[:digit:]' < README.md | head -n 15 | wc -L 
