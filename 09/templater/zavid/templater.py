#!/usr/bin/env python3

import argparse
import yaml
import jinja2
import io
import os
import sys

num_map = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
           (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
]

def arabic2roman(text):
    num = int(text)
    roman = ""
    while num > 0:
        for a, r in num_map:
            while num >= a:
                roman += r
                num -= a
    return roman

def jinja_filter_meters_to_feet(text):
    return float(text) * 3.2808


def get_yaml_header_and_content(file_name):
    hend=True
    header = ""
    content = ""
    with open(file_name) as f:
        for line in f:
            if line == "---\n":
                hend = not hend
                continue
            
            if not hend:
                header += line
                continue

            content += line

    return header, content


def get_jinja_environment(template_dir):
    env = jinja2.Environment(loader=jinja2.FileSystemLoader(template_dir),
                             autoescape=jinja2.select_autoescape(['html', 'xml']),
                             extensions=['jinja2.ext.do'])
    env.filters['m2ft'] = jinja_filter_meters_to_feet
    env.filters['arabic2roman'] = arabic2roman
    return env

def main(argv=None):
    if argv is None:
        argv = sys.argv[1:]
    args = argparse.ArgumentParser(description='Templater')
    args.add_argument('--template',
                      dest='template',
                      required=True,
                      metavar='FILENAME.j2',
                      help='Jinja2 template file')
    args.add_argument('--input',
                      dest='input',
                      required=True,
                      metavar='INPUT',
                      help='Input filename')


    config = args.parse_args(argv)

    try:
        env = get_jinja_environment(os.path.dirname(config.template))
        template = env.get_template(config.template)
    except FileNotFoundError:
        print("Template not found", file=sys.stderr)
        sys.exit(1)

    try:
        header, content = get_yaml_header_and_content(config.input)
    except FileNotFoundError:
        print("Input not found", file=sys.stderr)
        sys.exit(2)

    # TODO: extract YAML header next to these variables
    tmp = {
        'content': content,
        'TEMPLATE': config.template,
        'INPUT': config.input,
    }
    vars = { **tmp, **yaml.safe_load(header)}

    # Use \n even on Windows
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, newline='\n')
    
    result = template.render(vars)
    
    print(result)


if __name__ == '__main__':
    main(sys.argv[1:])
