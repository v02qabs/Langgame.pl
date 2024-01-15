#!/usr/bin/perl

print "Content-type: text/html; charset=utf-8 \n\n";
print "Hello Counter.\n";

open(DATALINE, "<", 'item.txt') or die("error");

while(my $line = <DATALINE>)
{
	chomp($line);#改行を削除
	print "data: ".$line+1."\n"; #データを表示
	my $ord = ord($line.$line);
	print "ord: ".$ord."\n";
	my $counter = $ord;
#	print "counter: ".$counter."\n";
	#&wri($counter);
}

close(DATALINE);

sub wri{
	open(DATAS, ">", "item.txt") or die("error");
		my($counter) = @_;
#		print "counter: ".$counter;
				my $c = chr($counter);
		print "modi : ".$c;
		print DATAS $c;
	close DATAS;
}
	
	
