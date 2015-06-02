#!/usr/bin/perl -l ## valid commands: MOVE,LEFT,RIGHT,REPORT,PLACE x,y,facing ##
use Math::Trig;@d=qw(NORTH EAST SOUTH WEST);$p=join("|",@d);$m=sub{($x,$y)=@_;$x
>=0&&$y>=0&&$x<5&&$y<5};sub i{1while$_[0]ne pop;$#_};@r=([0,0],0,0);sub a{($_[0]
[0]+sin($_[1]*pi/2),$_[0][1]+cos($_[1]*pi/2))};while(<>){/MOVE/&&$m->(a@r)?$r[0]
=[a@r]:/LEFT/?$r[1]--:/RIGHT/?$r[1]++:/^PLACE (\d),(\d),($p)$/&&$m->($1,$2)?@r=(
[$1,$2],i($3,@d),1):/REPORT/&&$r[2]?print"$r[0][0],$r[0][1],$d[int($r[1]%4)]":_}
