#!/usr/bin/env perl
use Math::Trig;
use List::MoreUtils qw(firstidx);

my @d=('NORTH','EAST','SOUTH','WEST');
my $p="(".join("|",@d).")";
my @r=([0,0],0,0);
my $m=sub {return $_[0][0]>=0&&$_[0][1]>=0&&$_[0][0]<=4&&$_[0][1]<=4};
my $t=sub {print $_[0][0].",".$_[0][1].",".$d[int($_[1]*2)]."\n"; return @_};
my $a=sub {return [$_[0][0]+sin($_[1]*pi),$_[0][1]+cos($_[1]*pi)]};

while (<>) {
  chomp;
  @r=$_=~/MOVE/&&$m->($a->(@r))?($a->(@r),$r[1],$r[2]):
     $_=~/LEFT/?($r[0],$r[1]-0.5,$r[2]):
     $_=~/RIGHT/?($r[0],$r[1]+0.5,$r[2]):
     $_=~/^PLACE\s(\d+),(\d+),$p$/&&$m->([$1,$2])?([$1,$2],(firstidx{/$3/}@d)/2,1):
     $_=~/REPORT/&&$r[2]?$t->(@r):@r;
}
