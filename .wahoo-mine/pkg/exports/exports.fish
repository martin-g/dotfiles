
set -x TERM xterm-256color

set -x GPGKEY 5F504C16
set -x DEVEL_HOME "$HOME/devel"
set -x ANT_HOME "$DEVEL_HOME/latest-ant"
set -x MAVEN_HOME "$DEVEL_HOME/maven-latest"
set -x M2_HOME $MAVEN_HOME
set -x SCALA_HOME "$DEVEL_HOME/scala-latest"
set -x JAVA_5_HOME "/opt/jdk1.5.0_22"
set -x JAVA_6_HOME "$DEVEL_HOME/jdk1.6.0_37"
set -x JAVA_7_HOME "$DEVEL_HOME/java-7"
set -x JAVA_8_HOME "$DEVEL_HOME/java-8"
set -x JAVA_9_HOME "$DEVEL_HOME/java-9"
set -x MONGODB_HOME "/opt/mongodb"
set -x SBT_HOME "$DEVEL_HOME/sbt"
set -x NODE_PATH "$DEVEL_HOME/node" "$DEVEL_HOME/node/lib/node_modules"
set -x PATH "$HOME/bin" "$DEVEL_HOME/phantomjs/bin" "$DEVEL_HOME/grails-2.2.4/bin" "$SBT_HOME/bin" "/usr/bin" "/bin" "$ANT_HOME/bin" "$MAVEN_HOME/bin" "$MVN_SHELL_HOME/bin" "$JAVA_8_HOME/bin" "$SCALA_HOME/bin" $PATH
set -x EDITOR vim
set -x MC_COLOR_TABLE ":editnormal=lightgray,gray:editbold=yellow,gray:editmarked=black,lightgray"
set -x SVN_EDITOR /home/martin/bin/svneditor
set -x PWDSH_SAFE "$HOME/.pwd.sh.safe"
set -x LS_COLORS 'rs=0:di=01;34:fi=92:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=1;91;103:';

#set -x LC_ALL=es_ES.UTF-8

set -e HISTSIZE
set -e HISTFILESIZE
