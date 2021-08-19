#!/usr/bin/env python3

import sys

def print_table(table):
    sor = dict(sorted(table.items()))
    for key, val in sor.items():
        print('  '+str(key)+': '+str(val))

def create_csv(file, table):
    sor = dict(sorted(table.items()))
    file.write('team'+','+'score'+'\n')
    for key, val in sor.items():
        file.write(str(key)+','+str(val)+'\n')
    file.close()

def podium(table):
    print('Medal podium')
    sor = sorted(table.items(), key=lambda item: -item[1])
    i = 0
    for key, val in sor:
        if i >= 3:
            return
        i += 1;
        print('  '+str(key))

def run_with_file(input_file):
    table = {}
    total = 0
    for line in input_file:
        line = line.strip()
        if (not line):
            continue
        parts = line.split()
        if parts[0] == 'add':
            if parts[1] in table:
                table[parts[1]] += int(parts[3])
            else:
                table[parts[1]] = int(parts[3])
        elif parts[0] == 'summary':
            print(line.strip('summary').strip())
            print_table(table)
        elif parts[0] == 'csv':
            with open(parts[1], 'w') as file:
                create_csv(file, table)
        elif parts[0] == 'podium':
            podium(table)

def main():
    if len(sys.argv) != 2:
        print("Run with exactly one argument - filename with commands.")
        return
    with open(sys.argv[1]) as inp:
        run_with_file(inp)

if __name__ == '__main__':
    main()
