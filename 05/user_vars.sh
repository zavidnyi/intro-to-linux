#!/bin/bash

usrname="$( whoami )"

env | grep "=.*$usrname.*" | cut -d= -f1
