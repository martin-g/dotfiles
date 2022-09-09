# ALIASES

function rust_check
  set_color blue; echo -e "\n\nFormatting the code ...\n"; set_color normal && cargo +nightly fmt --all && \
  
  set_color yellow; echo -e "Running tests...\n"; set_color normal; command cargo nextest run --test-threads (nproc) && \
    
  set_color red; echo -e "Running clippy...\n"; set_color normal; cargo clippy  --all-features --all-targets -- -Dclippy::all -Dunused_imports && \
  
  set_color purple; echo -e "Testing the documentation...\n"; set_color normal; cargo doc
end


function rust_full_check
  rust_check

  set -l min_supported_rust_version "1.54.0"

  set_color red; echo -e "Running clippy with Rust $min_supported_rust_version...\n"; set_color normal; cargo +{$min_supported_rust_version} clippy  --all-features --all-targets -- -Dclippy::all -Dunused_imports && \
    
  set_color blue; echo -e "Testing build with Wasm32...\n"; set_color normal; cargo clean; cargo build --target wasm32-unknown-unknown
end

function calc
  command eva $argv
end

function apt
  command sudo nala $argv
end

function ping 
	command ping -naDO -i 2 $argv
end

function ping
  command gping $argv
end

function timed
  set -l START (date)
  $argv
  set -l END (date)
  echo -e "\n\nCommand '$argv' started at $START and ended at $END"
end

function myip
  command curl -4 icanhazip.com
end

function apache-otp
  command donkey -f md5 $argv
end

function yq
  command docker run --rm -i -v $PWD:/workdir mikefarah/yq yq $argv
end

function hwinfo
  command inxi -Fxxxzf
end

function jflags
  command java -XX:+UnlockDiagnosticVMOptions -XX:+UnlockExperimentalVMOptions -XX:+PrintFlagsFinal  -version
end

# bind \eg 'gohome; commandline -f repaint' - Alt+G will go home
function gohome
    cd ~
end

function please
  command sudo $argv
end

function k 
  command kubectl $argv
end

function http
  command http --style=native $argv
end

function tree
  command tree -Cushf $argv
end

function l 
	ls -laFG --color
end

function preview
  command fzf --preview 'bat --color always {}'
end

function ll
  command ~/.cargo/bin/lsd -l $argv
end

function la
  command ~/.cargo/bin/lsd --long --almost-all $argv
end

function lll
  command exa-linux-x86_64  --long --header --git $argv
end

function top
  command sudo glances
end

function cat
	command bat $argv
end

function vi
	command vim $argv
end

function grepjson
  # Usage: grepjson "https://api.github.com/repos/tomnomnom/gron/commits?per_page=1" "commit.author"
  gron $argv[1] | fgrep $argv[2] | gron --ungron
end

function rsync
  command rsync -e ssh --progress -z -r -v $argv
end

function topnet
  command sudo sysdig -pc -c topprocs_net
end

function grep 
	command grep -nH --color=auto $argv
end

function g
	command grep -irnH --color=auto $argv
end

function p
	command ps faxuw | grep $argv
end

function cp
	command cp -i $argv
end

function mv
	command mv -vi $argv
end

function rm
	command rm -i $argv
end

function killall
	command killall --ignore-case --wait --ignore-case $argv
end

function wsite
	cd ~/git/apache/wicket-site
end
function w10
	cd ~/git/apache/wicket
end
function w9
	cd ~/git/apache/wicket-9.x
end
function w8
	cd ~/git/apache/wicket-8.x
end
function w7
	cd ~/git/apache/wicket-7.x
end
function w6
	cd ~/git/apache/wicket-6.x
end
function w5
	cd ~/git/apache/wicket-1.5.x
end
function w4
	cd ~/git/apache/wicket14
end
function cdg
	cd (git rev-parse --show-toplevel or pwd)
end
function downloads
	cd /store2/Downloads
end

function ..
	cd ..
end

function ...
	cd ../..
end

function ....
	cd ../../..
end


function b
  cd -
end

function addM
	git status --porcelain | grep "^.M " | cut -c4- | xargs git add
end
function addQ
	git status --porcelain | grep "^?? " | cut -c4- | xargs git add
end
function addD
	git status --porcelain | grep "^.D " | cut -c4- | xargs git rm
end
function git-root
	cd (git rev-parse --show-toplevel)
end
function savePrint
	xsel -b | hexdump -c
end
function weather
  set -l city $argv[1]
	command curl "wttr.in/$city"
end

function md
  mkdir -p $argv[1]
  cd $argv[1]
end

# Show failed tests among all the surefire results.
function tests_failed
	for DIR in (find . -maxdepth 3 -type d -name "surefire-reports")
		echo $DIR
		ruby -ne 'puts "#$FILENAME : #$&" if $_ =~ /(Failures: [1-9][0-9]*.*|Errors: [1-9][0-9]*.*)/' $DIR/*.txt
	end
end

# Show the top tests that took the longest time to run from maven surefire reports
function tests_slow
	set -l FILES

	for DIR in (find . -maxdepth 3 -type d -name "surefire-reports")
		set FILES $FILES $DIR/*.txt
	end
	
	head -q -n 4 $FILES | ruby -ne 'gets; print $_.chomp + " "; gets; print gets' | ruby -ane 'printf "%8.03f sec: ", $F[-2].to_f; puts $_' | sort -r | head -10
end

function macRandom
  set -l mac (openssl rand -hex 2 | sed 's/\(..\)/\1:/g; s/.$//')
  setMac f8:59:71:2f:$mac
end

function macOriginal
  setMac $ORIG_MAC
end

function setMac
	set -l mac $argv[1]
	#echo "Mac: $mac"
	sudo ifconfig wlp3s0 down
	sudo ifconfig wlp3s0 hw ether $mac
  sudo ifconfig wlp3s0 up
  echo "Your new physical address is $mac"
end

function cpu-temperature
  command cat /sys/class/thermal/thermal_zone*/temp | xargs -I{} awk "BEGIN {printf \"%.2f\n\", {}/1000}"
end
