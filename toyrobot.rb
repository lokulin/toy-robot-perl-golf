#!/usr/bin/env ruby
include Math;d=%w{NORTH EAST SOUTH WEST};p=d.join("|");t=->(x,y){x>=0&&y>=0&&
x<5&&y<5};x,y,f,z=0,0,0,0;a=->{[x+sin(f*PI/2),y+cos(f*PI/2)]};$<.each{|l|l=~
/^MOVE$/x&&t[*a[]]?(x,y=*a[]):l=~/^LEFT$/?f-=1:l=~/^RIGHT$/?f+=1:l=~/^REPORT$/&&
z==1?puts("#{x.to_i},#{y.to_i},#{d[f%4]}"):l=~/^PLACE\s(\d),(\d),(#{p})$/&&t[$1
.to_i,$2.to_i]?(x,y,f,z=$1.to_i,$2.to_i,d.index($3),1):0}
