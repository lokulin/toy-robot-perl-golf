#!/usr/bin/env perl
use Math::Trig;use List::MoreUtils ':all';@d=qw(NORTH EAST SOUTH WEST);
$p="(".join("|",@d).")";@r=([0,0],0,0);$m=sub{($x,$y)=@_;$x>=0&&$y>=0&&$x<=4
&&$y<=4};sub a{($_[0][0]+sin($_[1]*pi/2),$_[0][1]+cos($_[1]*pi/2))};while(<>)
{chomp;/MOVE/&&$m->(a(@r))?$r[0]=[a(@r)]:/LEFT/?$r[1]--:/RIGHT/?$r[1]++:
/PLACE\s(\d+),(\d+),$p/&&$m->($1,$2)?@r=([$1,$2],(firstidx{/$3/}@d),1):
/REPORT/&&$r[2]?print($r[0][0].",".$r[0][1].",".$d[int($r[1]%4)]."\n"):_;}
