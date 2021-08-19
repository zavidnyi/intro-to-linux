#!/usr/bin/env python3

# Made by zavidny
# 2021.05.10

from setuptools import setup


setup(
    name='tapsum2json',
    version='0.1',
    description='TAP to JSON converter',
    classifiers=[
      'Programming Language :: Python :: 3.7',
    ],
    keywords='tap json convert',
    install_requires=[
        'tap.py'
    ],
    include_package_data=True,
    zip_safe=False,
    packages=[
        'zavid',
    ],
    entry_points={
        'console_scripts': [
            'tapsum2json=zavid.tapsum2json:main',
        ],
    },
)

