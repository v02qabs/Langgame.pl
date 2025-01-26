#/user/bin/perl
use strict;
use warnings;

print"hello game.";

open(DATAFILE, "< wordlist.txt") or die("error :$!");
while(my $line = <DATAFILE>){

#	print $line;
my @lines = split /,/, $line;

# 先頭の行
	print "$lines[0].\n";
	
}

