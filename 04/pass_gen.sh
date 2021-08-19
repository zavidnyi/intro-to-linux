#!/bin/bash
echo -n 'Random password: ' && tr -dc A-Za-z0-9 </dev/urandom | head -c 20 && echo
