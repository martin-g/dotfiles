#!/bin/bash

IBUS_ENABLE_SYNC_MODE=1 # see https://youtrack.jetbrains.com/issue/IDEA-78860
JAVA_HOME=$JAVA_7_HOME
XMODIFIERS="" $DEVEL_HOME/idea/bin/idea.sh

# See http://askubuntu.com/questions/501907/keyboard-locks-in-intellij-idea-on-ubuntu-14-04
# manually : ibus-daemon -rd
