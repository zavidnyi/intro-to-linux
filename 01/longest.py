#!/usr/bin/env python3

import sys

def main():
    longest_line = ""
    for line in sys.stdin:
        if len(line) > len(longest_line):
            longest_line = line
    print(longest_line)

if __name__ == '__main__':
    main()
