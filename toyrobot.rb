#!/usr/bin/env ruby
include Math;d=%w{NORTH EAST SOUTH WEST};p=d.join("|");r=[[0,0],0];def t(x,y)x>=
0&&y>=0&&x<5&&y<5 end;def a(x,y,z)[x+sin(z*PI/2),y+cos(z*PI/2)]end;ARGF.each{|l|
l=~/^MOVE$/&&t(*a(*r[0],r[1]))?r[0]=a(*r[0],r[1]):l=~/^LEFT$/?r[1]-=1:l=~/^RIGHT
$/x?r[1]+=1:l=~/^REPORT$/&&r[2]?puts("#{r[0][0]},#{r[0][1]},#{d[r[1]%4]}"):l=~/^
PLACE\s(\d),(\d),(#{p})$/x&&t($1.to_i,$2.to_i)?r=[[$1.to_i,$2.to_i],d.index($3),1]:0}
