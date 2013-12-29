#!/bin/bash

cols=${COLUMNS:-185}
rows=${LINES:-51}

a=1;
x=1;
y=1;
xd=1;
yd=1;
while true; do 
  if [[ $x == $rows || $x == 0 ]]; then 
    xd=$(( $xd *-1 )) ; 
  fi ; 
  
  if [[ $y == $cols || $y == 0 ]]; then 
    yd=$(( $yd * -1 )) ; 
  fi ; 
  
  x=$(( $x + $xd )); 
  y=$(( $y + $yd )); 
  printf "\33[%s;%sH\33[48;5;%sm \33[0m" $x $y $(($a%199+16)) ;a=$(( $a + 1 )) ; 
  sleep 0.001 ;
done
