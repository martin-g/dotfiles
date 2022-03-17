#!/usr/bin/env fish

set -x BUS_ENABLE_SYNC_MODE 1 # see https://youtrack.jetbrains.com/issue/IDEA-78860
set -x JAVA_HOME $JAVA_17_HOME
set -x PATH $JAVA_HOME/bin $PATH
set -x XMODIFIERS "" 
eval $DEVEL_HOME/idea-IU-221.4906.8/bin/idea.sh

# See http://askubuntu.com/questions/501907/keyboard-locks-in-intellij-idea-on-ubuntu-14-04
# manually : ibus-daemon -rd
