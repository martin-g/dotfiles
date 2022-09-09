#!/usr/bin/env fish


set DATE (date +%y%m%d%H%M%S)
sudo evtest /dev/input/event5 | tee ~/Documents/touchpad-events-{$DATE}.txt

#xinput --disable 9
#sleep 3
#xinput --enable 9
