#!/usr/bin/env python3

# Made by zavidny
# 2021.05.10

import sys
import json
from tap.parser import Parser
from tap.line import Plan, Result

def get_summary(file_name):
        output = {"filename": file_name,
                   "total": 0,
                   "passed": 0,
                   "skipped": 0,
                   "failed": 0}
        try:
                parser = Parser()
                for line in parser.parse_file(file_name):
                        if isinstance(line, Plan):
                                output["total"] = line.expected_tests
                                continue
                        if isinstance(line, Result):
                                if line.skip:
                                        output["skipped"] += 1
                                elif line.ok:
                                        output["passed"] += 1
                                else:
                                        output["failed"] += 1
                                continue
        except FileNotFoundError:
                print("File not Found", file=sys.stderr)
        return output


def main():
        output = {"summary":[]}
        for file_name in sys.argv[1:]:
                output["summary"].append(get_summary(file_name))

        json.dump(output, sys.stdout, indent=True)
        print()



if __name__ == '__main__':
    main()
