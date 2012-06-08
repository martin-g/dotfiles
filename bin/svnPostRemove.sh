#!/bin/bash

svn st | grep '^!' | cut -d' ' -f 8 | xargs svn remove
