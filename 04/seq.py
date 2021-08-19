#!/usr/bin/env python3

import sys

def printout(args):
    out = ""
    try:
        try:
            cur_n = int(args[0])
        except ValueError:
            print("Wrong argument (integer expected).", file=sys.stderr)
            sys.exit(1)
    except IndexError:
        print(out, end='', file=sys.stdout)
        sys.exit(0)

    try:
        try:
            step = int(args[1])
        except ValueError:
            print("Wrong argument (integer expected).", file=sys.stderr)
            sys.exit(1)
        if step == 0:
            print("Step cannot be zero.", file=sys.stderr)
            sys.exit(3)
    except IndexError:
        for i in range(1, cur_n+1):
            out += str(i) + ' '
        print(out.strip(), file=sys.stdout)
        sys.exit(0)

    try:
        try:
            target = int(args[2])
        except ValueError:
            print("Wrong argument (integer expected).", file=sys.stderr)
            sys.exit(1)
        if (target > cur_n and step < 0) or (target < cur_n and step > 0):
            print("", end='', file=sys.stdout)
            sys.exit(0)
    except IndexError:
        for i in range(cur_n, step + 1):
            out += str(i) + ' '
        print(out.strip(), file=sys.stdout)
        sys.exit(0)

    if step > 0:
        for i in range(cur_n, target + 1, step):
            out += str(i) + ' '
    else:
        for i in range(cur_n, target - 1, step):
            out += str(i) + ' '

    print(out.strip(), file=sys.stdout)
    sys.exit(0)


def main():
    if len(sys.argv) > 4 or len(sys.argv) == 1:
        print("Wrong argument count.", file=sys.stderr)
        sys.exit(2)

    printout(sys.argv[1:])


if __name__=='__main__':
    main()
