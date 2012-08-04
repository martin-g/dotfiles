# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ]; then
    case " $(groups) " in *\ admin\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.

	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
                elif [ -x /usr/share/command-not-found ]; then
		   /usr/bin/python /usr/share/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi

# MOI

export GREP_OPTIONS="--color=auto"
export TERM=xterm-color

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
        xterm-color)
                #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
                PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[01;31m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
		GIT_PS1_SHOWDIRTYSTATE=true
		GIT_PS1_SHOWSTASHSTATE=true
		GIT_PS1_SHOWUNTRACKEDFILES=true
		GIT_PS1_SHOWUPSTREAM=auto

                ;;
        *)
                PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
                ;;
esac

cd /tmp

# don't overwrite existing files
set -o noclobber

export GPGKEY=5F504C16
export DEVEL_HOME="/home/martin/devel"
export ANT_HOME="$DEVEL_HOME/ant-latest"
export MAVEN_HOME="$DEVEL_HOME/maven-latest"
export M2_HOME=$MAVEN_HOME
export SCALA_HOME="$DEVEL_HOME/scala-latest"
export PATH=$HOME/local/node/bin:$PATH
export JAVA_HOME="/usr/lib/jvm/java-6-sun"
export JAVA_5_HOME="/opt/jdk1.5.0_22"
export MONGODB_HOME="/opt/mongodb"
export NODE_PATH="$HOME/local/node/bin:$HOME/local/node:$HOME/local/node/lib/node_modules"
export PATH=$MONGODB_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:$MVN_SHELL_HOME/bin:$JAVA_HOME/bin:$SCALA_HOME/bin:$PATH:/var/lib/gems/1.8/bin
export PATH=~/bin:$PATH
export EDITOR=vim
export MC_COLOR_TABLE=":editnormal=lightgray,gray:editbold=yellow,gray:editmarked=black,lightgray"
export SVN_EDITOR=/home/martin/bin/svneditor
export JREBEL_PATH="/home/martin/.IntelliJIdea11/config/plugins/jr-ide-idea/lib/jrebel/jrebel.jar"

#export LC_ALL=es_ES.UTF-8

unset HISTSIZE
unset HISTFILESIZE

# Creates a folder and goes inside it
function md {
  mkdir -p $1
  cd $1
}

source ~/.aliases
