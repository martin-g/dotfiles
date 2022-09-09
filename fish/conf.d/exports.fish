
set -x TERM xterm-256color
set -x ANDROID_HOME "/home/martin/Android/Sdk"
set -x GRADLE_HOME "/home/martin/devel/gradle"
#set -x GPGKEY 5F504C16
set -x GPGKEY 0BE83EB05F504C16
set -x GPG_TTY (tty)
set -x DEVEL_HOME "$HOME/devel"
set -x ANT_HOME "$DEVEL_HOME/apache-ant"
set -x MAVEN_HOME "$DEVEL_HOME/maven-latest"
set -x M2_HOME $MAVEN_HOME
set -x MVND_HOME "$DEVEL_HOME/maven-mvnd/dist/target/mvnd-0.8.1-SNAPSHOT-linux-amd64"
set -x MAVEN_SKIP_PLUGINS "-Dcheckstyle.skip=true -Dspotbugs.skip=true -Dmaven.gitcommitid.skip=true"
set -x JAVA_5_HOME "/opt/jdk1.5.0_22"
set -x JAVA_6_HOME "$DEVEL_HOME/java-6"
set -x JAVA_7_HOME "$DEVEL_HOME/java-7"
set -x JAVA_8_HOME "/usr/lib/jvm/java-8-openjdk-amd64"
set -x JAVA_11_HOME "/usr/lib/jvm/java-11-openjdk-amd64"
set -x JAVA_17_HOME "/usr/lib/jvm/java-17-openjdk-amd64"
set -x JAVA_18_HOME "$DEVEL_HOME/jdk-18"
set -x JAVA_19_HOME "$DEVEL_HOME/jdk-19"
set -x JAVA_20_HOME "$DEVEL_HOME/jdk-20"
set -x GRAALVM_HOME "$DEVEL_HOME/graalvm-ce-java11-20.2.0"
set -x JAVA_HOME "$JAVA_17_HOME"
set -x JMETER_HOME "$DEVEL_HOME/apache-jmeter-5.2.1"
set -x VEGETA_HOME "$DEVEL_HOME/vegeta"
set -x DOTNET_HOME "$HOME/.dotnet"
set -x MONGODB_HOME "/opt/mongodb"
set -x NODE_PATH "$DEVEL_HOME/node.js" "$DEVEL_HOME/node.js/lib/node_modules"
set -x GO_HOME "$DEVEL_HOME/go-latest"
set -x GOPATH "$HOME/golang-path"
set -x PROTOC_HOME "$DEVEL_HOME/protoc"
set -x PATH "$HOME/bin" "$GO_HOME/bin" "$DOTNET_HOME" "$DEVEL_HOME/node.js/bin" "$VEGETA_HOME" "$DEVEL_HOME/grails-2.2.4/bin" "$GOPATH/bin" "$ANT_HOME/bin" "$MAVEN_HOME/bin" "$MVN_SHELL_HOME/bin" "$JAVA_HOME/bin" "$GRADLE_HOME/bin" "$HOME/.local/bin/" "$HOME/.bloop" "$HOME/.krew/bin/" "$HOME/.cargo/bin/" "$JMETER_HOME/bin" "$GRAALVM_HOME/bin" "$MVND_HOME/bin" "$PROTOC_HOME/bin" $PATH
set -x RUST_BACKTRACE 1
set -x RUST_LOG warn
set -x EDITOR vim
set -x MC_COLOR_TABLE ":editnormal=lightgray,gray:editbold=yellow,gray:editmarked=black,lightgray"
set -x SVN_EDITOR /home/martin/bin/svneditor
set -x PWDSH_SAFE "$HOME/.pwd.sh.safe"
#set -x LS_COLORS 'rs=0:di=01;34:fi=92:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=1;91;103:';
#set LS_COLORS 'rs=0:di=00;36:ln=01;30;40:mh=00:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.tlz=00;31:*.txz=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.dz=00;31:*.gz=00;31:*.lz=00;31:*.xz=00;31:*.bz2=00;31:*.bz=00;31:*.tbz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.rar=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.svgz=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.ogm=00;35:*.3gp=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.flv=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.cgm=00;35:*.emf=00;35:*.axv=00;35:*.anx=00;35:*.ogv=00;35:*.ogx=00;35:*.aac=00;33:*.au=00;33:*.flac=00;33:*.mid=00;33:*.midi=00;33:*.mka=00;33:*.mp3=00;33:*.mpc=00;33:*.ogg=00;33:*.ra=00;33:*.wav=00;33:*.axa=00;33:*.oga=00;33:*.spx=00;33:*.xspf=00;33:*.c=00;37;44:*.C=00;37;44:*.cc=00;37;44:*.cpp=00;37;44:*.scala=00;33;44:*.java=00;37;44:*.h=00;33;41:*.H=00;33;41:*.hh=00;33;41:*.hpp=00;33;41:'

set -x NVM_DIR "$HOME/.nvm"
#set -x LC_ALL=es_ES.UTF-8

set -e HISTSIZE
set -e HISTFILESIZE




# https://ismisepaul.wordpress.com/2015/03/04/http2-traffic-in-wireshark/
set -x SSLKEYLOGFILE "/home/martin/tls/sslkeylog.log"
