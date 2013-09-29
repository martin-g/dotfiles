#!/bin/bash
# from http://www.ubuntugeek.com/how-to-clear-cached-memory-on-ubuntu.html

sync; echo 3 | sudo tee /proc/sys/vm/drop_caches
