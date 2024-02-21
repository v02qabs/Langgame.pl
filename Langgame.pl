print "If you start game when , push the Enter key. \n";
my $Enter = <STDIN>;
my $op;
print "使いたい問題集を入力して下さい。\n";
print "Eng:english , France:fran, Korian: hungule : ";

my $chooser_lang=<STDIN>;
chomp($chooser_lang);
my $count;
my $lines;
my $c1;
my $b1;
my $answer;
open($op ,"<", "./$chooser_lang.txt");
@lines = map { $_ } <$op>;

print "--grep---"."\n";

for($c1=0;$c1<=$#lines; $c1++)
{
	print "問題:".$lines[$c1++];

	if($c1 % 2 != 0)
	{
		print "練習 ".$lines[$c1];
		
	}
	$answer = <STDIN>;
	chomp($answer);
	chomp($lines[$c1]);
	if($answer eq $lines[$c1]){
		print "正解\n";
	}
	else{
		print "間違い\n";
	}
		
}


	

