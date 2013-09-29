#!/bin/bash

# Shows which thread eats the CPU
# from http://nurkiewicz.blogspot.de/2012/08/which-java-thread-consumes-my-cpu.html
# execute: watch -n cpu-thread.sh

PID=$(top -n1 | grep -m1 java | perl -pe 's/\e\[?.*?[\@-~] ?//g' | cut -f1 -d' ')
NID=$(printf '%x' $(top -n1 -H | grep -m1 java | perl -pe 's/\e\[?.*?[\@-~] ?//g' | cut -f1 -d' '))
jstack $PID | grep -A500 $NID | grep -m1 '^$' -B 500