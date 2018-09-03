# ALIASES

function l 
	ls -laFG --color
end

function preview
  command fzf --preview 'bat --color always {}'
end

function lll
  command exa-linux-x86_64  --long --header --git
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

function ping 
	command ping -naDO -i 2 $argv
end

function grep 
	command grep -nH --color=auto $argv
end

function g
	command grep --color=auto $argv
end

function p
	command ps faxuw | gre $argv
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
function wsite
	cd ~/git/apache/wicket-site
end
function w9
	cd ~/git/apache/wicket
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
function movies
	cd /store1/
end
function ..
	cd ..
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
	command weather -m
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
