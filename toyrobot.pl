#!/usr/bin/env perl
use Math::Trig;use POSIX qw(floor);use List::MoreUtils qw(firstidx);
my @d=('NORTH','EAST','SOUTH','WEST');my $p="(".join("|",@d).")";
my @r=([0,0],0,0);
my $m=sub {return $_[0]>=0 && $_[1]>=0 && $_[0]<=4 && $_[1]<=4};
sub a{return ($_[0][0]+sin($_[1]*pi),$_[0][1]+cos($_[1]*pi))};
sub f{return $_[0]-2.0*floor($_[0]/2.0)};
while(<>){chomp;$_=~/MOVE/&&$m->(a(@r))?$r[0]=[a(@r)]:
$_=~/LEFT/?$r[1]=f($r[1]-0.5):$_=~/RIGHT/?$r[1]=f($r[1]+0.5):
$_=~/^PLACE\s(\d+),(\d+),$p$/&&$m->($1,$2)?@r=([$1,$2],(firstidx{/$3/}@d)/2,1):
$_=~/REPORT/&&$r[2]?print($r[0][0].",".$r[0][1].",".$d[int($r[1]*2)]."\n"):_;}
