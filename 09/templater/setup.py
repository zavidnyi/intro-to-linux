#!/usr/bin/env python3

# Made by zavidny
# 2021.05.10

from setuptools import setup


setup(
    name='templater',
    version='0.1',
    description='templater',
    classifiers=[
      'Programming Language :: Python :: 3.7',
    ],
    keywords='jinja templater',
    install_requires=[
        'Jinja2==2.11.3',
        'MarkupSafe==1.1.1',
        'PyYAML==5.4.1'
    ],
    include_package_data=True,
    zip_safe=False,
    packages=[
        'zavid',
    ],
    entry_points={
        'console_scripts': [
            'templater=zavid.templater:main',
        ],
    },
)

